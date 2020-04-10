class AddOpenedsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :opend, :boolean, default: false
  end
end
