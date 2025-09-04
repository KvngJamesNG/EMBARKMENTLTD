class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product, counter_cache: true

    validates :content, presence: true
      validates :quality_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
      validates :packaging_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
      validates :delivery_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
      validates :accuracy_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
      validates :communication_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
      validates :location_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
      validates :value_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_commit :update_final_rating, on: [:create, :update]

  def update_final_rating
    total_points = quality_rating + 
    packaging_rating + 
    delivery_rating + 
    accuracy_rating + 
    communication_rating + 
    location_rating + 
    value_rating

    update_column(:final_rating, total_points.to_f / 7.0)

    product.update_average_rating
  end

end
