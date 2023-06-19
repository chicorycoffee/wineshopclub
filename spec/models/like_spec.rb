require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    post = FactoryBot.create(:post)
    user = FactoryBot.create(:user)
    @like = FactoryBot.build(:like, user_id: user.id, post_id: post.id)
    sleep 0.1
  end

  describe 'いいね機能' do
    context 'いいねできる場合' do
      it 'user_idとpost_idがあれば保存できる' do
        expect(@like).to be_valid
      end
    end

    context 'いいねができない場合' do
      it 'user_idが空ではいいねできない' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include 'Userを入力してください'
      end

      it 'post_idが空ではいいねできない' do
        @like.post_id = nil
        @like.valid?
        expect(@like.errors.full_messages).to include 'Postを入力してください'
      end
    end
  end
end
