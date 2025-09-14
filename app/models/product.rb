class Product < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  monetize :price_cents, allow_nil: true
  
  has_many_attached :images

  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy

  has_many :wishlisted_users, through: :wishlists, source: :user, dependent: :destroy
  
  has_many :preorders, dependent: :destroy
  has_many :preordered_users, through: :preorders, source: :user, dependent: :destroy

  # def update_average_rating
  #   average_rating = reviews.average(:final_rating)
  #   update_column(:average_final_rating, average_rating)
  # end

  # Update the average_rating column (use the existing column)
  def update_average_rating
    average_rating = reviews.average(:final_rating)
    update_column(:average_rating, average_rating)
  end

  def average_final_rating
    reviews.average(:final_rating)
  end

  def wishlisted_by?(user = nil)
    return if user.nil?

    wishlisted_users.include?(user)
  end

  def available_dates
    next_preorder = preorders.upcoming_preorders.first
    current_preorder = preorders.current_preorders.first

    if current_preorder.nil? && next_preorder.nil?
      Date.tomorrow.strftime('%e %b')..(Date.tomorrow + 30.days).strftime('%e %b')
    elsif current_preorder.nil?
      Date.tomorrow.strftime('%e %b')..next_preorder.checkin_date.strftime('%e %b')
    elsif next_preorder.nil?
      current_preorder.checkout_date.strftime('%e %b')..(Date.tomorrow + 30.days).strftime('%e %b')
    else
      current_preorder.checkout_date.strftime('%e %b')..next_preorder.checkin_date.strftime('%e %b')
    end
  end
end