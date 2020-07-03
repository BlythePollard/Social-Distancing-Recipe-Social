class User < ApplicationRecord
    has_secure_password

    has_many :memberships
    has_many :groups, through: :memberships

    has_many :recipes
    has_many :saved_recipes
end