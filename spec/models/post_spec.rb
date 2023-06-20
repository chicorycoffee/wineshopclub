require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @post = FactoryBot.build(:post)
  end

  describe '商品投稿' do
    context '商品が投稿できる場合' do
      it 'すべての情報が入力されれば投稿できる' do
        expect(@post).to be_valid
      end

      it 'importerが空でも投稿できる' do
        @post.importer = ''
        expect(@post).to be_valid
      end

      it 'taste_idが初期値でも投稿できる' do
        @post.taste_id = 1
        expect(@post).to be_valid
      end

      it 'grape_idが初期値でも投稿できる' do
        @post.grape_id = 1
        expect(@post).to be_valid
      end

      it 'price_idが初期値でも投稿できる' do
        @post.price_id = 1
        expect(@post).to be_valid
      end

      it 'textが空でも投稿できる' do
        @post.text = ''
        expect(@post).to be_valid
      end

      it '画像が空でも投稿できる' do
        @post.image = nil
        expect(@post).to be_valid
      end
      it 'nameが空でも投稿できる' do
        @post.name = ''
        expect(@post).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it 'titleが空では登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('キャッチコピーを入力してください')
      end
      it 'titeが31文字以上では登録できない' do
        @post.title = '仮' * 31
        @post.valid?
        expect(@post.errors.full_messages).to include('キャッチコピーは30文字以内で入力してください')
      end

      it 'nameが51文字以上では登録できない' do
        @post.name = '仮' * 51
        @post.valid?
        expect(@post.errors.full_messages).to include('商品名は50文字以内で入力してください')
      end
      it 'importerが16文字以上では登録できない' do
        @post.importer = '仮' * 16
        @post.valid?
        expect(@post.errors.full_messages).to include('輸入業者・卸売業者名は15文字以内で入力してください')
      end
      it 'importerが16文字以上では登録できない' do
        @post.importer = '仮' * 16
        @post.valid?
        expect(@post.errors.full_messages).to include('輸入業者・卸売業者名は15文字以内で入力してください')
      end
      it 'genre_idが初期値では登録できない' do
        @post.genre_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('商品ジャンルを選んでください')
      end
      it 'country_idが初期値では登録できない' do
        @post.country_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('産地を選んでください')
      end
      it 'type_idが初期値では登録できない' do
        @post.type_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('ワインタイプを選んでください')
      end
      it 'textが141字以上では登録できない' do
        @post.text = '仮' * 141
        @post.valid?
        expect(@post.errors.full_messages).to include('補足コメントは140文字以内で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
