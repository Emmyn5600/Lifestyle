class Article < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :votes, foreign_key: :article_id
  has_many :voters, through: :votes, source: :user
  has_many :companies, foreign_key: :article_id, inverse_of: :article
  has_many :categories, through: :companies
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :text, presence: true, length: { minimum: 5, maximum: 50 }
  validates :image, presence: true
end
