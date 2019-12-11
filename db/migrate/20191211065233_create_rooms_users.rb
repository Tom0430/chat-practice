class CreateRoomsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms_users, id: false do |t|
      t.references :room, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
    end
  end
end
