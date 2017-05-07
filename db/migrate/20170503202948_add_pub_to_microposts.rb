class AddPubToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :microposts, :pub, foreign_key: true
  end
end
