class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original_url
      t.string :short_url
      t.integer :page_views, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
