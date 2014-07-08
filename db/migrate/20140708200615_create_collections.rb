class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.integer :priority
      t.timestamps
    end
  end
end
