class Competition < ApplicationRecord

    has_many :clubs
    has_many :players
    has_many :matches

end
