class AddPubToMenus < ActiveRecord::Migration[5.0]
  def change
    add_reference :menus, :pub, foreign_key: true
  end
end
