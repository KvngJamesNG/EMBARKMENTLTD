class AddReviewsCountToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :reviews_count, :integer
  end
end
