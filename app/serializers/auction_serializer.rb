class AuctionSerializer
    include FastJsonapi::ObjectSerializer
   attributes :name, :location, :start_date, :end_date

    attribute :guitars do |guitar|
        auction.guitars.map do |gui|
            {
            brand: gui.brand,
            model: gui.model,
            year: gui.year,
            price: gui.price
            }
   has_many :guitars, serializer GuitarSerializer
        end
    end
end