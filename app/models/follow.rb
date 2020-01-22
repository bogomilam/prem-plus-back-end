class Follow < ApplicationRecord
  belongs_to :user
  has_one :club
end
