class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :slug, :unique => true, :null => false
      t.string :subtitle
      t.datetime :datetime, :null => false
      t.boolean :published, :null => false
      t.boolean :comments_enabled, :null => false

      t.timestamps
    end
  end
end
