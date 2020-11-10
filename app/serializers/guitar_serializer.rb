class GuitarSerializer
    include FastJsonapi::ObjectSerializer
    attributes :brand, :model, :year, :price
  end