class Preorder < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true

  scope :upcoming_preorders, -> { where("checkin_date >= ?", Date.today).order(:checkin_date) }
  scope :past_preorders, -> { where("checkout_date < ?", Date.today).where("checkout_date < ?", Date.today).order(:checkout_date) }
  scope :current_preorders, -> { where("checkin_date <= ? AND checkout_date >= ?", Date.today, Date.today).order(:checkin_date) } # ✅ added
end
