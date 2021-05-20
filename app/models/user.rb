class User < ApplicationRecord
  has_many :articles, foreign_key: :user_id, class_name: 'Article'
  has_many :votes, foreign_key: :user_id
  has_many :voted_articles, through: :votes, source: :article
  has_many :comments

  validates :name, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true
end
