require 'rails_helper'

describe "Sign in flow" do

  include TestFactories

  describe "successful" do
    it "redirects to the topics index" do
      user = authenticated_user
      visit root_path

      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

       expect(current_path).to eq topics_path
    end
  end
end