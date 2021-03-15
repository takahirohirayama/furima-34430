class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :presence
  belongs_to :days_to_ship

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :shipping_charge_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :days_to_ship_id, numericality: { other_than: 1 } 
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end
end
