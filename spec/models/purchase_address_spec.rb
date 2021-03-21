require 'rails_helper'
describe PurchaseAddress do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての項目が入力されれば商品購入ができる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_address.building = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと購入できない' do
        @purchase_address.post_cord = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post cord can't be blank")
      end
      it '都道府県が選択されていないと購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @purchase_address.phone_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '郵便番号にハイフンが含まれていないと購入できない' do
        @purchase_address.post_cord = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end
      it '電話番号は11桁以内でないと購入できない' do
        @purchase_address.phone_num = '111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
      end
    end
  end
end
