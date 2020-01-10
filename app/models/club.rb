class Club < ApplicationRecord
    has_one :clubStat
    has_many :home_games, class_name: 'Fixture', foreign_key: :home_id
    has_many :away_games, class_name: 'Fixture', foreign_key: :away_id

end
