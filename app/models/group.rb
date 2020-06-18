class Group < ApplicationRecord

    has_many :users
    has_many :recipes, through: :users
end