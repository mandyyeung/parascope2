class AddSlugToTables < ActiveRecord::Migration
  def change
    add_column :collections, :slug, :string
    add_index :collections, :slug
    
    add_column :articles, :slug, :string
    add_index :articles, :slug
  end
end
