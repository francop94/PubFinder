class CreatePubs < ActiveRecord::Migration[5.0]
  def change
    create_table :pubs do |t|
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :pubs, [:user_id, :created_at]
  end
end
