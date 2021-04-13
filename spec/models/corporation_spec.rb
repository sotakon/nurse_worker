require 'rails_helper'
describe '法人モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '法人の名前が空の場合' do
      it 'バリデーションにひっかる' do
        corporation = Corporation.new(name: '', area: '失敗テスト')
        expect(corporation).not_to be_valid
      end
    end
    context '法人のエリアが空の場合' do
      it 'バリデーションにひっかる' do
        corporation = Corporation.new(name: '失敗テスト', area: '')
        expect(corporation).not_to be_valid
      end
    end
  end
end