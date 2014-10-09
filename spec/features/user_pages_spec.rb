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

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }
        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.success') }
      end

    end
  end

  describe "profile page" do
    before { visit user_path(user) }
    it{ should have_content(user.name) }
  end

  describe "edit page" do

    before do
      @user = FactoryGirl.create(:user)
      visit edit_user_path(@user)
    end

    it{ should have_content(@user.name) }
    it{ should have_title(full_title("Edit | #{@user.name}")) }

    describe "editing user" do

      before do 
        fill_in "Name", with: "x#{@user.name}"
        fill_in "Email", with: "x#{@user.email}"
      end

      it "changes the user name" do
        expect{ click_button "Submit" 
            @user.reload}.to change(@user, :name)
      end

      it "changes the user email" do
        expect{ click_button "Submit"
            @user.reload}.to change(@user, :email)
      end


    end

  end

  describe "index page" do

    before do
      @user1 = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      visit users_path
    end

    it{ should have_content("Users") }
    it{ should have_selector("#delete_user_#{@user1.id}") }
    it{ should have_selector("#delete_user_#{@user2.id}") }
    it{ should have_selector("#edit_user_#{@user1.id}") }
    it{ should have_selector("#edit_user_#{@user2.id}") }
    it{ should have_content("#{@user1.id}") }
    it{ should have_content("#{@user2.id}") }
    it{ should have_content("#{@user1.name}") }
    it{ should have_content("#{@user2.name}") }
    it{ should have_content("#{@user1.email}") }
    it{ should have_content("#{@user2.email}") }    

  end

end