require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール登録' do
    context 'プロフィールが登録できる場合' do
      it 'すべての情報が入力されれば投稿できる' do
        expect(@profile).to be_valid
      end
      it 'shopが空でも投稿できる' do
        @profile.shop = ''
        expect(@profile).to be_valid
      end
      it 'prefecture_idが初期値でも投稿できる' do
        @profile.prefecture_id = 1
        expect(@profile).to be_valid
      end
      it 'customer_idが初期値でも投稿できる' do
        @profile.customer_id = 1
        expect(@profile).to be_valid
      end
      it 'price_idが初期値でも投稿できる' do
        @profile.price_id = 1
        expect(@profile).to be_valid
      end
      it 'country_idが初期値でも投稿できる' do
        @profile.country_id = 1
        expect(@profile).to be_valid
      end
      it 'introductionが空でも投稿できる' do
        @profile.introduction = ''
        expect(@profile).to be_valid
      end
    end
    context 'プロフィールが登録できない場合' do
      it 'shopが31文字以上であれば登録できない' do
        @profile.shop = '仮' * 31
        @profile.valid?
        expect(@profile.errors.full_messages).to include('店名は30文字以内で入力してください')
      end
      it 'introductionが141文字以上であれば登録できない' do
        @profile.introduction = '仮' * 141
        @profile.valid?
        expect(@profile.errors.full_messages).to include('紹介コメントは140文字以内で入力してください')
      end
      it 'userが紐付いていないと登録できない' do
        @profile.user = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
