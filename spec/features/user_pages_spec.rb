require 'spec_helper'

describe "User pages" do

  subject{ page }

  let(:user) { FactoryGirl.create(:user) }

  describe "signup page" do  
    before{ visit signup_path }
    it{ should have_content('Sign Up') }
    it{ should have_title(full_title("Sign Up")) }
  end

  describe "signup" do
    before do
      visit signup_path
    end

    let(:submit){ "Submit" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do        
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "password"
        fill_in "Confirm password", with: "password"
        choose 'Male'
      end

      it "should create a user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    before{ visit user_path(user) }
    it{ should have_content(user.name) }
  end

end