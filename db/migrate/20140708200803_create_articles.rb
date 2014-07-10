class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.boolean :archived, default: false
      t.integer :priority, default: 0
      t.timestamps
    end
  end
end
