require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
    before do
      user = FactoryBot.create(:user, email: "tete@tete")
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    describe '購入内容確認' do
      it "購入できる時" do
        expect(@order_buyer).to be_valid
      end

      it "building_nameが空でも購入できる時" do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end

      context '購入できない時' do
        it "tokenが空では購入できないこと" do
          @order_buyer.token =  ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
        end
      
        it "postal_codeが空では購入できないこと" do
          @order_buyer.postal_code = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
        end

        it "postal_codeにハイフン（-）がないと購入できないこと" do
          @order_buyer.postal_code = '1234567'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Postal code is invalid")
        end

        it "postal_codeが英数字、全角半角混合では購入できないこと" do
          @order_buyer.postal_code = '1a３'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Postal code is invalid")
        end

        it "shipping_areaが1では購入できないこと" do
          @order_buyer.shipping_area_id = 1
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Shipping area must be other than 1")
        end

        it "cityが空では購入できないこと" do
          @order_buyer.city = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("City can't be blank")
        end

        it "cityが英数字では購入できないこと" do
          @order_buyer.city = 'tokyo1'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("City is invalid")
        end

        it "addressが空では購入できないこと" do
          @order_buyer.address = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
        end

        it "phone_numberが空では購入できないこと" do
          @order_buyer.phone_number = ''
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
        end

        it "phone_numberが12桁以上では購入できないこと" do
          @order_buyer.phone_number = '012345678910'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
        end

        it "phone_numberが平仮名、カタカナ、漢字、英語では購入できないこと" do
          @order_buyer.phone_number = 'あイ鵜eooooooo'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
        end

        it "userが紐づいていないと購入できないこと" do
          @order_buyer.user_id = nil
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("User can't be blank")
        end

        it "itemが紐づいていないと購入できないこと" do
          @order_buyer.item_id = nil
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end
