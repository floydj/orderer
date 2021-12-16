require "test_helper"

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = Product.create(title: "Something")
    Model.create(title: "one", product: @product, display: 1)
    Model.create(title: "three", product: @product, display: 3)
    Model.create(title: "four", product: @product, display: 4)
    Model.create(title: "two", product: @product, display: 2)
  end

  test "models_by_display without translations" do
    assert_equal Product.includes(:models_by_display).find(@product.id).models_by_display.pluck(:title),
      %w[one two three four]
  end

  test "models_by_display with translations eager loaded" do
    assert_equal %w[one two three four],
      Product.i18n.includes(:models_by_display).eager_load(:string_translations).find(@product.id).models_by_display.pluck(:title)
  end

  test "models_by_display without translations eager loaded" do
    assert_equal %w[one two three four],
      Product.i18n.includes(:models_by_display).find(@product.id).models_by_display.pluck(:title)
  end
end
