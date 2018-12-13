module CustomerProductsHelper
  def products_not_empty?
    @products && @products.any?
  end
end
