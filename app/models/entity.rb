# frozen_string_literal: true

class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :groups_entities, dependent: :destroy
  has_many :groups, through: :groups_entities
end
