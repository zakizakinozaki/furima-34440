class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string  :postal_code,     null: false
      t.string  :city,            null: false
      t.string  :address,         null: false
      t.string  :building
      t.string  :phone_num,       null: false
      t.integer :state_id,        null: false
      t.references :purchase,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
