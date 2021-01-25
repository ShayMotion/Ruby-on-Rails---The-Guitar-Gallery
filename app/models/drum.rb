class Drum < ApplicationRecord
    belongs_to :auction
    belongs_to :user
end
