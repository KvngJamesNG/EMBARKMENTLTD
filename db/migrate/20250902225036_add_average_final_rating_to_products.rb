class AddAverageFinalRatingToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :average_rating, :decimal
  end
end
