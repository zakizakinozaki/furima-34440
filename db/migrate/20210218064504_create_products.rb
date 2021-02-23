class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                   null: false, default: ''
      t.text :description,              null: false
      t.integer :price,                 null: false
      t.integer :category_id,           null: false
      t.integer :status_id,             null: false
      t.integer :cost_id,               null: false
      t.integer :state_id,              null: false
      t.integer :day_id,                null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end
