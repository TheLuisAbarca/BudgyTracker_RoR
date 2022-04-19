class Group < ApplicationRecord
    validates :name, presence: true
    validates :icon, presence: true
    validates :name, uniqueness: true

    has_many :group_entities, dependent: :destroy
    has_many :entities, through: :group_entities
end
