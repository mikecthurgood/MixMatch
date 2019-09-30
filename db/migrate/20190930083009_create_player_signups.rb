class CreatePlayerSignups < ActiveRecord::Migration[6.0]
  def change
    create_table :player_signups do |t|
      t.integer :listing_id
      t.integer :player_id

      t.timestamps
    end
  end
end
