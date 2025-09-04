class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wishlists, dependent: :destroy

  has_many :wishlisted_products, through: :wishlists, source: :product, dependent: :destroy
end
