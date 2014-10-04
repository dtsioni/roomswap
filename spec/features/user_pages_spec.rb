require 'spec_helper'

describe "User pages" do
  subject{ page }
  let(:user) { FactoryGirl.create(:user) }
  describe "signup page" do  
    before{ visit signup_path }
    it{ should have_content('Sign Up') }
    it{ should have_title(full_title("Sign Up")) }
  end
  describe "profile page" do
    before{ visit user_path(user) }
    it{ should have_content(user.name) }
  end
end