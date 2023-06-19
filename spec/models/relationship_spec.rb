require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user.password = 'aaa111'
    @another_user = FactoryBot.create(:user)
    @another_user.password = 'aaa111'
    @relationship = @user.follow(@another_user)
  end

  describe 'フォロワー登録' do
    context 'フォロワーできる' do
      it 'followerとfollowingにそれぞれuserが紐づいてれば登録できる' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォローできない' do
      it 'follower_idがないと保存できない' do
        @relationship.follower_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Followerを入力してください')
      end

      it 'following_idがないと保存できない' do
        @relationship.following_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Followingを入力してください')
      end
    end
  end
end
