require 'rails_helper.rb'
require 'helpers/omniauth_helper'

feature 'Log-In' do 

  context 'using ID.me' do

    describe 'authenticated users' do

      context 'with existing accounts' do
        before :context do
          attributes = FactoryGirl.attributes_for(:verified_idme_user)
          @user = User.create!(attributes)
          oauth_config_success(uid: @user.uid, affiliation: @user.affiliation, 
                               verified: @user.verified)
        end

        it 'can sign in via ID.me' do
          visit '/users/auth/idme'
          expect(page).to have_content 'Successfully authenticated from ID.me account.'
        end
      end

      context 'without existing accounts' do
        before :context do
          @attributes = FactoryGirl.attributes_for(:verified_idme_user)
          oauth_config_success(uid: @attributes[:uid], affiliation: @attributes[:affiliation], 
                               verified: @attributes[:verified])
        end

        it 'must create a username and password before being signed in' do
          visit '/users/auth/idme'
          expect(page).to have_content 'Sign up'
        end

        it 'should be able to submit the sign up form' do
          visit '/users/auth/idme'
          fill_in 'Email', with: @attributes[:email]
          fill_in 'Username', with: @attributes[:username]
          fill_in 'Password', with: @attributes[:password]
          fill_in 'Password confirmation', with: @attributes[:password]
          click_button 'Sign up'
          expect(page).to have_content 'Welcome! You have signed up successfully.'
        end
      end
    end

    describe 'failed authentication' do
      before :context do
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
    before :context do
      @attributes = FactoryGirl.attributes_for(:user) 
      @user = User.create!(@attributes)
    end

    let(:username) { @attributes[:username] }
    let(:password) { @attributes[:password] }

    it "allows signin via username and password" do
      visit '/users/sign_in'
        
      fill_in 'Username', with: username
      fill_in 'Password', with: password

      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end
end