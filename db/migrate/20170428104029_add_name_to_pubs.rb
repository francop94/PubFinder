class AddNameToPubs < ActiveRecord::Migration[5.0]
  def change
    add_column :pubs, :name, :string
  end
end
