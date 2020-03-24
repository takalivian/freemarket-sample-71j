require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
     user = User.new(nickname: "", email: "test@spec", password: "0000000", password_confirmation: "0000000", first_name: "太郎", last_name: "山田", first_name_kana: "たろう", last_name_kana: "やまだ", birthday: "12340101", send_first_name: "花子", send_last_name: "山田", send_first_name_kana: "はなこ", send_last_name_kana: "やまだ")
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end