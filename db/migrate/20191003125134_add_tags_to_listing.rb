class AddTagsToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :tags, :string
  end
end
