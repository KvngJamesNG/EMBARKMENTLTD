class CreatePreorders < ActiveRecord::Migration[7.1]
  def change
    create_table :preorders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.date :checkin_date
      t.date :checkout_date

      t.timestamps
    end
    add_index :preorders, [:user_id, :product_id, :checkin_date, :checkout_date], unique: true
  end
end
