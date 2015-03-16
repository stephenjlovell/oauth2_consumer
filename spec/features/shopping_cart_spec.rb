require 'rails_helper.rb'
require 'helpers/omniauth_helper'

feature "shopping cart" do

  context "when logged in" do

    before :each do
      attributes = FactoryGirl.attributes_for(:verified_idme_user)
      @user = User.create!(attributes)
      oauth_config_success(uid: @user.uid, affiliation: @user.affiliation, 
                           verified: @user.verified)
      visit '/users/auth/idme'
      first(:button, 'Add to Cart').click
    end

    it "can add items to the shopping cart" do
      expect(current_path).to eq '/order_items'
      expect(page).to have_content 'Successfully added product to cart.'
    end

    context "within the shopping cart page" do
      # before do
      #   visit '/order_items'
      # end

      # let(:new_quantity) { 4 }

      # it "can update the item quantity" do
      #   fill_in "quantity", with: new_quantity
      #   click_button "update"
      #   expect(page).to have_content "Your items (#{new_quantity})"
      # end

    end

  end

end