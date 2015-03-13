require 'rails_helper.rb'
require 'helpers/omniauth_helper'

describe 'Log-In' do 

  context 'using ID.me' do

    context 'authenticated users' do

      context 'with existing accounts' do
        before do
          @user_attributes = FactoryGirl.attributes_for(:verified_idme_user)
          @user = User.create!(@user_attributes)
          oauth_config_success
        end

        it 'can sign in via ID.me' do
          visit '/users/auth/idme'
          expect(page).to have_content 'Successfully authenticated from ID.me account.'
        end
      end

      context 'without existing accounts' do
        before do
          oauth_config_success
        end

        it 'must create a username and password' do
          visit '/users/auth/idme'
          expect(page).to have_content 'Sign up'
        end
      end

    end

    context 'failed authentication' do
      before do
        oauth_config_failure(message: :access_denied)
      end
      it 'prevents sign in' do
        visit '/users/auth/idme'
        expect(page).to_not have_content 'Successfully authenticated from ID.me account.'
        expect(page).to have_content 'Could not authenticate you'
      end

    end

  end

  context 'without using ID.me' do 

    before do
      @user_attributes = FactoryGirl.attributes_for(:user) 
      @user = User.create!(@user_attributes)
    end

    let(:username) { @user_attributes[:username] }
    let(:password) { @user_attributes[:password] }

    it "allows signin via username and password" do
      visit '/users/sign_in'
        
      fill_in 'Username', with: username
      fill_in 'Password', with: password

      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end

  end
  
end