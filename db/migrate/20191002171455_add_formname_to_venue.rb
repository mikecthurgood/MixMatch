class AddFormnameToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :form_name, :string
  end
end
