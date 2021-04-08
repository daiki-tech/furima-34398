require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
    before do
      @order_buyer = FactoryBot.build(:order_buyer)
    end

    describe '購入内容確認' do
      it "購入できる時" do
        expect(@order_buyer).to be_valid
      end

      context '購入できない時' do
        it "tokenが空では購入できないこと" do
          @order_buyer.token = nil
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

        it "phone_numberが平仮名、カタカナ、漢字、英語では購入できないこと" do
          @order_buyer.phone_number = 'あイ鵜eooooooo'
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Phone number is invalid")
        end
      end
    end
end
