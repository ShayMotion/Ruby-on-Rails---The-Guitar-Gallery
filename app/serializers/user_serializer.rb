class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :username, :name, 
    has_many :auctions, serializer: AuctionsSerializer
    attribute :hometown do |user|
      {
        city: user.hometown.city,
        state: user.hometown.state,
        country: user.hometown.country
      }
    end
  end