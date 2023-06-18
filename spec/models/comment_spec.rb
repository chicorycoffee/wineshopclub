require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment, user_id: user.id, post_id: post.id)
    sleep 0.1
  end

  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを保存できない場合' do
      it "textが空では保存できない" do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "コメントを入力してください"
      end

      it 'textが141字以上では保存できない' do
       @comment.text = '仮' * 141
       @comment.valid?
       expect(@comment.errors.full_messages).to include "コメントは140文字以内で入力してください"
      end


      it "userが紐づいていないと保存できない" do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Userを入力してください"
      end

      it "postが紐づいていないと保存できない" do
        @comment.post_id = nil
        
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Postを入力してください"
      end
    end
  end
end

