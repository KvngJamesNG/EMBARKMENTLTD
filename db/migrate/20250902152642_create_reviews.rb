class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :quality_rating
      t.integer :packaging_rating
      t.integer :delivery_rating
      t.integer :accuracy_rating
      t.integer :communication_rating
      t.integer :location_rating
      t.integer :value_rating
      t.decimal :final_rating
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
