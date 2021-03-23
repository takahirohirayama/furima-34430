class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :days_to_ship_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
