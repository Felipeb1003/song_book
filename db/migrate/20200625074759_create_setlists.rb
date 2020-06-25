class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :name
      t.string :type_of_show
      t.string :location
      t.date :date
      t.integer :user_id
      t.integer :song_id
    end

  end
end
