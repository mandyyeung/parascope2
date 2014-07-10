class Article < ActiveRecord::Base
  has_many :collection_articles
  has_many :collections, through: :collection_articles

  def archive
    self.archived = true
    self.save
  end

  def archived?
    !!archived
  end

  accepts_nested_attributes_for :collections
end

