class Company < ApplicationRecord
  belongs_to :category
  belongs_to :article
  accepts_nested_attributes_for :category

  validates :category, presence: true
  validates :article, presence: true
end
