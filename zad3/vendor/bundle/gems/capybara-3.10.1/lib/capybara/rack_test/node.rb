# frozen_string_literal: true

class Capybara::RackTest::Node < Capybara::Driver::Node
  BLOCK_ELEMENTS = %w[p h1 h2 h3 h4 h5 h6 ol ul pre address blockquote dl div fieldset form hr noscript table].freeze

  def all_text
    native.text
          .gsub(/[\u200b\u200e\u200f]/, '')
          .gsub(/[\ \n\f\t\v\u2028\u2029]+/, ' ')
          .gsub(/\A[[:space:]&&[^\u00a0]]+/, '')
          .gsub(/[[:space:]&&[^\u00a0]]+\z/, '')
          .tr("\u00a0", ' ')
  end

  def visible_text
    displayed_text.gsub(/\ +/, ' ')
                  .gsub(/[\ \n]*\n[\ \n]*/, "\n")
                  .gsub(/\A[[:space:]&&[^\u00a0]]+/, '')
                  .gsub(/[[:space:]&&[^\u00a0]]+\z/, '')
                  .tr("\u00a0", ' ')
  end

  def [](name)
    string_node[name]
  end

  def style(_styles)
    raise NotImplementedError, 'The rack_test driver does not process CSS'
  end

  def value
    string_node.value
  end

  def set(value, **options)
    return if disabled? || readonly?

    warn "Options passed to Node#set but the RackTest driver doesn't support any - ignoring" unless options.empty?

    if value.is_a?(Array) && !multiple?
      raise TypeError, "Value cannot be an Array when 'multiple' attribute is not present. Not a #{value.class}"
    end

    if radio? then set_radio(value)
    elsif checkbox? then set_checkbox(value)
    elsif input_field? then set_input(value)
    elsif textarea? then native['_capybara_raw_value'] = value.to_s
    end
  end

  def select_option
    return if disabled?

    deselect_options unless select_node.multiple?
    native['selected'] = 'selected'
  end

  def unselect_option
    raise Capybara::UnselectNotAllowed, 'Cannot unselect option from single select box.' unless select_node.multiple?

    native.remove_attribute('selected')
  end

  def click(keys = [], **offset)
    raise ArgumentError, 'The RackTest driver does not support click options' unless keys.empty? && offset.empty?

    if link?
      follow_link
    elsif submits?
      associated_form = form
      Capybara::RackTest::Form.new(driver, associated_form).submit(self) if associated_form
    elsif checkable?
      set(!checked?)
    elsif tag_name == 'label'
      click_label
    end
  end

  def tag_name
    native.node_name
  end

  def visible?
    string_node.visible?
  end

  def checked?
    string_node.checked?
  end

  def selected?
    string_node.selected?
  end

  def disabled?
    return true if string_node.disabled?

    if %w[option optgroup].include? tag_name
      find_xpath('parent::*[self::optgroup or self::select or self::datalist]')[0].disabled?
    else
      !find_xpath('parent::fieldset[@disabled] | ancestor::*[not(self::legend) or preceding-sibling::legend][parent::fieldset[@disabled]]').empty?
    end
  end

  def path
    native.path
  end

  def find_xpath(locator)
    native.xpath(locator).map { |el| self.class.new(driver, el) }
  end

  def find_css(locator)
    native.css(locator, Capybara::RackTest::CSSHandlers.new).map { |el| self.class.new(driver, el) }
  end

  def ==(other)
    native == other.native
  end

protected

  # @api private
  def displayed_text(check_ancestor: true)
    if !string_node.visible?(check_ancestor)
      ''
    elsif native.text?
      native.text
            .gsub(/[\u200b\u200e\u200f]/, '')
            .gsub(/[\ \n\f\t\v\u2028\u2029]+/, ' ')
    elsif native.element?
      text = native.children.map do |child|
        Capybara::RackTest::Node.new(driver, child).displayed_text(check_ancestor: false)
      end.join || ''
      text = "\n#{text}\n" if BLOCK_ELEMENTS.include?(tag_name)
      text
    else
      ''
    end
  end

private

  def deselect_options
    select_node.find_xpath('.//option[@selected]').each { |node| node.native.remove_attribute('selected') }
  end

  def string_node
    @string_node ||= Capybara::Node::Simple.new(native)
  end

  # a reference to the select node if this is an option node
  def select_node
    find_xpath('./ancestor::select[1]').first
  end

  def type
    native[:type]
  end

  def form
    if native[:form]
      native.xpath("//form[@id='#{native[:form]}']")
    else
      native.ancestors('form')
    end.first
  end

  def set_radio(_value) # rubocop:disable Naming/AccessorMethodName
    other_radios_xpath = XPath.generate { |xp| xp.anywhere(:input)[xp.attr(:name) == self[:name]] }.to_s
    driver.dom.xpath(other_radios_xpath).each { |node| node.remove_attribute('checked') }
    native['checked'] = 'checked'
  end

  def set_checkbox(value) # rubocop:disable Naming/AccessorMethodName
    if value && !native['checked']
      native['checked'] = 'checked'
    elsif !value && native['checked']
      native.remove_attribute('checked')
    end
  end

  def set_input(value) # rubocop:disable Naming/AccessorMethodName
    if text_or_password? && attribute_is_not_blank?(:maxlength)
      # Browser behavior for maxlength="0" is inconsistent, so we stick with
      # Firefox, allowing no input
      value = value.to_s[0...self[:maxlength].to_i]
    end
    if value.is_a?(Array) # Assert multiple attribute is present
      value.each do |val|
        new_native = native.clone
        new_native.remove_attribute('value')
        native.add_next_sibling(new_native)
        new_native['value'] = val.to_s
      end
      native.remove
    else
      native['value'] = value.to_s
    end
  end

  def attribute_is_not_blank?(attribute)
    self[attribute] && !self[attribute].empty?
  end

  def follow_link
    method = self['data-method'] if driver.options[:respect_data_method]
    method ||= :get
    driver.follow(method, self[:href].to_s)
  end

  def click_label
    labelled_control = if native[:for]
      find_xpath("//input[@id='#{native[:for]}']")
    else
      find_xpath('.//input')
    end.first

    labelled_control.set(!labelled_control.checked?) if checkbox_or_radio?(labelled_control)
  end

  def link?
    tag_name == 'a' && !self[:href].nil?
  end

  def submits?
    (tag_name == 'input' && %w[submit image].include?(type)) || (tag_name == 'button' && [nil, 'submit'].include?(type))
  end

  def checkable?
    tag_name == 'input' && %w[checkbox radio].include?(type)
  end

protected

  def checkbox_or_radio?(field = self)
    field&.checkbox? || field&.radio?
  end

  def checkbox?
    input_field? && type == 'checkbox'
  end

  def radio?
    input_field? && type == 'radio'
  end

  def text_or_password?
    input_field? && (type == 'text' || type == 'password')
  end

  def input_field?
    tag_name == 'input'
  end

  def textarea?
    tag_name == 'textarea'
  end
end
