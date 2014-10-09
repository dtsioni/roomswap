require 'spec_helper'

describe "Authentication" do 
  subject{ page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do

    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.error') }
    end

    describe "with valid information" do      

      before do
        @user = FactoryGirl.create(:user)
        fill_in "Email",    with: @user.email.upcase
        fill_in "Password", with: @user.password
        click_button "Sign in"
      end

      it { should have_title(@user.name) }     

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

    end

  end

end