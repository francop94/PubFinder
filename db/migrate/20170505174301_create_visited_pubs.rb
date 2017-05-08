class CreateVisitedPubs < ActiveRecord::Migration[5.0]
  def change
    create_table :visited_pubs do |t|
      t.integer :pub_id
      t.integer :user_id

      t.timestamps
    end
  end
end
