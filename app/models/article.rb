class Article < ActiveRecord::Base
  has_many :collection_articles
  has_many :collections, through: :collection_articles

  def archive
    archived = true
  end

  def archived?
    !!archived
  end
end

