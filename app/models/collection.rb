class Collection < ActiveRecord::Base
  has_many :user_collections
  has_many :users, through: :user_collections
  has_many :collection_articles
  has_many :articles, through: :collection_articles
end
