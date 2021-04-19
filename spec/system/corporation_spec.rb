require 'rails_helper'
RSpec.describe 'ユーザー機能（法人側）', type: :system do
  describe '新規登録機能' do
    context 'ユーザーが新規登録した場合' do
      it 'ユーザーが新規登録される' do
        visit new_corporation_registration_path
        fill_in 'corporation[name]', with: 'テスト'
        fill_in 'corporation[area]', with: 'テスト'
        fill_in 'corporation[email]', with: 'corporation@gmail.com'
        fill_in 'corporation_password', with: '123456'
        fill_in 'corporation_password_confirmation', with: '123456'
        click_on '新規登録'
        expect(page).to have_content 'マイページ'
      end
    end
  end
  
  describe 'ユーザーログイン機能' do
    before do
      @corporation = FactoryBot.create(:corporation)
    end
    context 'ユーザーがログインした場合' do
      it 'ログインできる' do
        visit new_corporation_session_path
        fill_in 'corporation[email]', with: 'test@corporation.com'
        fill_in 'corporation_password', with: '123456'
        click_on 'commit'
        expect(page).to have_content 'マイページ'
      end
    end
  end

  describe 'ユーザー編集機能' do
    before do
      @second_corporation = FactoryBot.create(:second_corporation)
      visit new_corporation_session_path
      fill_in 'corporation[email]', with: 'testtest@corporation.com'
      fill_in 'corporation_password', with: '234567'
      click_on 'commit'
    end
    context 'ユーザーがログインしている場合' do
      it 'マイページへ飛べる' do
        visit corporation_path(@second_corporation.id)
        expect(page).to have_content 'テスト'
      end
    end

    context 'ユーザーがプロフィールを編集した場合' do
      it 'プロフィールが更新される' do
        visit edit_corporation_registration_path
        fill_in 'corporation[name]', with: '名前変更'
        click_on '登録'
        visit corporation_path(@second_corporation.id)
        expect(page).to have_content '名前変更'
      end
    end

    context 'ユーザーが求人を投稿した場合' do
      it '求人が表示される' do
        visit new_job_path
        fill_in 'job[name]', with: 'テスト'
        fill_in 'job[area]', with: 'テスト'
        click_on '登録する'
        click_on '登録する'
        expect(page).to have_content 'テスト'
      end
    end

    context 'ユーザーが求人をワード検索した場合' do
      it '検索した求人が表示される' do
        visit new_job_path
        fill_in 'job[name]', with: 'テスト'
        fill_in 'job[area]', with: 'テスト'
        click_on '登録する'
        click_on '登録する'
        visit jobs_path
        fill_in 'name_or_area_or_content_cont', with: 'テスト'
        click_on 'commit'
        expect(page).to have_content 'テスト'
      end
    end
  end
end