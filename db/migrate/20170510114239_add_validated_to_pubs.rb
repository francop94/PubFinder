class AddValidatedToPubs < ActiveRecord::Migration[5.0]
  def change
    add_column :pubs, :validated, :boolean, default: false
  end
end
