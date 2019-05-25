class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.string :timestamps

      t.timestamps
    end
  end
end
