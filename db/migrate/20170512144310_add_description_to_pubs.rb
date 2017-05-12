class AddDescriptionToPubs < ActiveRecord::Migration[5.0]
  def change
    add_column :pubs, :description, :text
  end
end
