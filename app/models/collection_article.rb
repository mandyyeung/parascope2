class CollectionArticle < ActiveRecord::Base
  belongs_to :collection
  belongs_to :article
end
