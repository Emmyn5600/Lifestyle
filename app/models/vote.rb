class Vote < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :article, class_name: 'Article'
end
