module CustomerProductsHelper
  def products_not_empty?
    @products && !@products.empty?
  end
end
