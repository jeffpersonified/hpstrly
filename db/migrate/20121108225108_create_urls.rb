class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :in_url
      t.string :out_url
      t.integer :page_views

      t.timestamps
    end
  end
end
