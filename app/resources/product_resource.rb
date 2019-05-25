class ProductResource < JSONAPI::Resource
  attributes :name, :category, :price

  filter :name
end
