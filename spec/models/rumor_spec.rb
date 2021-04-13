require 'rails_helper'
describe 'クチコミモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'クチコミの法人名が空の場合' do
      it 'バリデーションにひっかる' do
        rumor = Rumor.new(name: '', area: '失敗テスト', content: '失敗テスト')
        expect(rumor).not_to be_valid
      end
    end
    context 'クチコミのエリアが空の場合' do
      it 'バリデーションにひっかる' do
        rumor = Rumor.new(name: '失敗テスト', area: '', content: '失敗テスト')
        expect(rumor).not_to be_valid
      end
    end
    context 'クチコミの内容が空の場合' do
      it 'バリデーションにひっかる' do
        rumor = Rumor.new(name: '失敗テスト', area: '失敗テスト', content: '')
        expect(rumor).not_to be_valid
      end
    end
  end
end