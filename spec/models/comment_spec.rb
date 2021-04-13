require 'rails_helper'
describe 'コメントモデル機能', type: :model do
  describe 'コメントのテスト' do
    context 'コメントが空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
  end
end