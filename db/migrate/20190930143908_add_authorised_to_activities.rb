class AddAuthorisedToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :authorised, :boolean, default: false
  end
end
