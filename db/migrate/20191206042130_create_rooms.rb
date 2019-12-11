class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, length: { maximum: 20 }
      t.string :password_digest
      t.string :description, null:false, length: { maximum: 200 }

      t.timestamps
    end
  end
end
