class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :key
      t.text :duration
      t.text :lyrics
      t.integer :user_id
      t.integer :setlist_id
    end
  end
end
