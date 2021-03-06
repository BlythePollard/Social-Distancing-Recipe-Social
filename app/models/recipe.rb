class Recipe < ApplicationRecord
    validates :title, presence: true
    validates :description, presence:true
    
    belongs_to :user
    belongs_to :group

    has_one_attached :avatar
end