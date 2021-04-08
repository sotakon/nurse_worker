require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe '新規登録機能' do
    context 'ユーザーが新規登録した場合' do
      it 'ユーザーが新規登録される' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'テスト'
        fill_in 'user_age', with: '20'
        fill_in 'user[area]', with: 'テスト'
        fill_in 'user[email]', with: 'test@gmail.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'
        click_on '新規登録'
        expect(page).to have_content 'マイページ'
      end
    end
  end
  
  describe 'ユーザーログイン機能' do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'ユーザーがログインした場合' do
      it 'ログインできる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test@gmail.com'
        fill_in 'user_password', with: '123456'
        click_on 'ログインする'
        expect(page).to have_content 'マイページ'
      end
    end
  end
  describe 'ユーザー編集機能' do
    before do
      @second_user = FactoryBot.create(:second_user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'testtest@test.com'
      fill_in 'user_password', with: '234567'
      click_on 'ログインする'
    end
    context 'ユーザーがログインしている場合' do
      it 'マイページへ飛べる' do
        visit user_path(@second_user.id)
        expect(page).to have_content 'テスト'
      end
    end

    context 'ユーザーがプロフィールを編集した場合' do
      it 'プロフィールが更新される' do
        visit edit_user_registration_path
        fill_in 'user[name]', with: '名前変更'
        click_on '登録'
        visit user_path(@second_user.id)
        expect(page).to have_content '名前変更'
      end
    end

    context 'ユーザーがユーザー一覧を選択した場合' do
      it 'ユーザー一覧が表示される' do
        click_on 'ユーザー一覧'
        expect(page).to have_content 'テスト2'
      end
    end

    context 'ユーザーがユクチコミを投稿した場合' do
      it 'クチコミが表示される' do
        visit new_rumor_path
        fill_in 'rumor[name]', with: 'テスト'
        fill_in 'rumor[area]', with: 'テスト'
        click_on '登録する'
        click_on '登録する'
        expect(page).to have_content 'テスト'
      end
    end

    context 'ユーザーがユクチコミをワード検索した場合' do
      it '検索したクチコミが表示される' do
        visit new_rumor_path
        fill_in 'rumor[name]', with: 'テスト'
        fill_in 'rumor[area]', with: 'テスト'
        click_on '登録する'
        click_on '登録する'
        visit rumors_path
        fill_in 'q[name_or_area_or_content_cont]', with: 'テスト'
        click_on 'commit'
        expect(page).to have_content 'テスト'
      end
    end


  end
end