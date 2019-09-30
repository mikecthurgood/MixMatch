class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :venue_id
      t.integer :activity_id
      t.integer :organiser_id
      t.integer :num_players
      t.string :description

      t.timestamps
    end
  end
end
