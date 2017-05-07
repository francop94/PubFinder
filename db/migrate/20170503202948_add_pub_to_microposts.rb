class AddPubToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :microposts, :pub, foreign_key: true
    add_foreign_key :microposts, :pubs
  end
add_foreign_key :microposts, :pubs
end
