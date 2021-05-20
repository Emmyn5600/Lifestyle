class Category < ApplicationRecord
  has_many :companies, foreign_key: :category_id
  has_many :articles, -> { order(id: 'desc') }, through: :companies

  validates :name, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true

  validates :priority, presence: true, uniqueness: true
end
