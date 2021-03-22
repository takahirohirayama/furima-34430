class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :city, :address, :building, :phone_num, :token

  with_options presence: true do
    validates :post_cord,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_num, numericality: { lonly_integer: true }, length: { maximum: 11 }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_num: phone_num, purchase_id: purchase.id)
  end
end
