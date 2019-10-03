class AddTagsToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :tags, :string
  end
end
