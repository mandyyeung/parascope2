class Article < ActiveRecord::Base
  has_many :collection_articles
  has_many :collections, through: :collection_articles

  validates_presence_of :url

  def archive
    self.archived = true
    self.save
  end

  def archived?
    !!archived
  end

  def upvote
    self.priority += 1
    self.save
  end

  def downvote
    self.priority -= 1
    self.save
  end

  def vote_links
    if self.priority < 1
      upvote
    elsif self.priority < 2
      dowvote
    end
  end

  def linkify
    link = self.url.gsub(/^(https|http):\/\//, "")
    "http://#{link}"
  end

  accepts_nested_attributes_for :collections
end
