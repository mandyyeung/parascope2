class Collection < ActiveRecord::Base
  has_many :user_collections
  has_many :users, through: :user_collections
  has_many :collection_articles
  has_many :articles, through: :collection_articles

	validates_presence_of :name

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
end
