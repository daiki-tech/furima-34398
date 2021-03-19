require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品できる時' do
        it '全ての情報が存在すれば出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品出品できないとき' do
        it 'imageが空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end
        it 'nameが空では出品できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end
        it 'descriptionが空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Description can't be blank"
        end
        it 'categoryが1では出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 1"
        end
        it 'item_statusが1では出品できない' do
          @item.item_status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Item status must be other than 1"
        end
          it 'shipping_chargeが1では出品できない' do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping charge must be other than 1"
        end
        it 'shipping_areaが1では出品できない' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping area must be other than 1"
        end
        it 'shipping_dateが1では出品できない' do
          @item.shipping_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping date must be other than 1"
        end
        it 'selling_priceが空では出品できない' do
          @item.selling_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price can't be blank"
        end
        it 'selling_priceが半角英数字混合では出品できない' do
          @item.selling_price = '2000a'
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price is not a number"
        end
        it 'selling_priceが半角英語では出品できない' do
          @item.selling_price = 'one billion'
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price is not included in the list"
        end
        it 'selling_priceが全角英語では出品できない' do
          @item.selling_price = 'ONE　BILLION'
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price is not included in the list"
        end
        it 'selling_priceが299円以下では出品できない' do
          @item.selling_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price is not included in the list"
        end
        it 'selling_priceが10,000,000円以上では出品できない' do
          @item.selling_price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include "Selling price is not included in the list"
        end
        it 'userが紐づいていないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end
      end
    end
  end
end