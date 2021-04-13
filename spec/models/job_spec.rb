require 'rails_helper'
describe '求人モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '求人の法人名が空の場合' do
      it 'バリデーションにひっかる' do
        job = Job.new(name: '', area: '失敗テスト', content: '失敗テスト')
        expect(job).not_to be_valid
      end
    end
    context '求人のエリアが空の場合' do
      it 'バリデーションにひっかる' do
        job = Job.new(name: '失敗テスト', area: '', content: '失敗テスト')
        expect(job).not_to be_valid
      end
    end
    context '求人の内容が空の場合' do
      it 'バリデーションにひっかる' do
        job = Job.new(name: '失敗テスト', area: '失敗テスト', content: '')
        expect(job).not_to be_valid
      end
    end
  end
end