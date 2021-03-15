require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "商品出品登録がうまくいくとき" do  
      it "すべての項目が入力されれば商品登録ができる" do
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999であれば登録できる" do
        @item.price = "2500"
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context "商品出品登録がうまくいかないとき" do
      it "画像が空だと登録できない" do
      end
      it "商品名が空だと登録できない" do
      end
      it "商品説明がないと登録できない" do
      end
      it "カテゴリーが選択されていないと登録できない" do
      end
      it "商品の状態が選択されていないと登録できない" do
      end
      it "配送料の負担が選択されていないと登録できない" do
      end
      it "配送元の地域が選択されていないと登録できない" do
      end
      it "配送までの日数が選択されていないと登録できない" do
      end
      it "販売価格が空だと登録できない" do
      end
      it "販売価格が¥300未満だと登録できない" do
      end
      it "販売価格が¥10,000,000以上だと登録できない" do
      end
      it "販売価格の記載が半角数字以外だと登録できない" do
      end
    end
  end
end