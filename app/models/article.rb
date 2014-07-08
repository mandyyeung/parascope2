class Article < ActiveRecord::Base
  has_many :collection_articles
  has_many :collections, through: :collection_articles
end
