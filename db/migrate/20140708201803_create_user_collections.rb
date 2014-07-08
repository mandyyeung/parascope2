class CreateUserCollections < ActiveRecord::Migration
  def change
    create_table :user_collections do |t|
      t.belongs_to :user
      t.belongs_to :collection
      t.timestamps
    end
  end
end
