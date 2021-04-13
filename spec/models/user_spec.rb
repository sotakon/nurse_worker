require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', age: '失敗テスト', area: '失敗テスト')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの年齢が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '失敗テスト', age: '', area: '失敗テスト')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのエリアが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '失敗テスト', age: '失敗テスト', area: '')
        expect(user).not_to be_valid
      end
    end
  end
end