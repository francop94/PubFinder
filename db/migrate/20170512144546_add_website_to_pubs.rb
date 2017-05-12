class AddWebsiteToPubs < ActiveRecord::Migration[5.0]
  def change
    add_column :pubs, :website, :string
  end
end
