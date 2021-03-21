class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_cord,     null: false 
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :building
      t.string     :phone_num,     null: false
      t.references :purchase,      null: false, foreign_kye: true
      t.timestamps
    end
  end
end
