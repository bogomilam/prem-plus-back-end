class User < ApplicationRecord
    has_one :club
    has_secure_password
end
