class CreateCollectionArticles < ActiveRecord::Migration
  def change
    create_table :collection_articles do |t|
      t.belongs_to :collection
      t.belongs_to :article
      t.timestamps
    end
  end
end
