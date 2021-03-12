require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context "新規登録がうまくいくとき" do  
    it "すべての項目が入力されれば新規登録ができる" do
     expect(@user).to be_valid
    end
    it "passwordが６文字以上かつ半角英数字が混じっていれば登録ができる" do
     @user.password = "aaa000"
     @user.password_confirmation = 'aaa000'
     expect(@user).to be_valid
    end
   end
  end
end