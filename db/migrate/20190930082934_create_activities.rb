class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.string :wiki_link

      t.timestamps
    end
  end
end
