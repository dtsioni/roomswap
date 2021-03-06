require 'spec_helper'
describe User do

  before{ @user = User.new(name: "Example User", email: "example_user@example.com",
    password: "password", password_confirmation: "password", university_id: "1",
    gender: "gender") }
  subject{ @user }
  #### model
  it{ should respond_to(:name) }
  it{ should respond_to(:email) }
  it{ should respond_to(:password_digest) }
  it{ should respond_to(:password) }
  it{ should respond_to(:password_confirmation) }
  it{ should respond_to(:remember_token) }
  it{ should respond_to(:authenticate) }
  it{ should respond_to(:university_id) }
  it{ should respond_to(:home_id) }
  it{ should respond_to(:gender) }
  it{ should be_valid }
  #### name
  describe "when name is too long" do
    before { @user.name = "a" * 21 }
    it{ should_not be_valid }
  end

  describe "when name is too short" do
    before { @user.name = "a" * 2 }
    it{ should_not be_valid }
  end

  describe "when name is not present" do
    before { @user.name = " " }
    it{ should_not be_valid }
  end
  #### password
  describe "when password is too short" do
    before do
      @user.password = @user.password_confirmation = "a" * 5
    end
    it{ should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "example_user@example.com", password: " ",
        password_confirmation: " ")
    end
    it{ should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before{ @user.password_confirmation = "mismatch" }
    it{ should_not be_valid }
  end
  #### authentication
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  #### email
  describe "when email is not present" do
    before{ @user.email = " " }
    it{ should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it{should_not be_valid}
  end

  #### ids

  describe "when university_id is not present" do
    before { @user.university_id = " " }
    it{ should_not be_valid }
  end

  describe "when user has no swap and no home id" do
    before{ @user.home_id = " " }
    it{ should be_valid }
  end

  describe "when user has a swap and no home id" do
    before do
      @user.swap = FactoryGirl.create(:swap)
      @user.home_id = " "
    end

    it{ should_not be_valid }
  end


  #### gender

  describe "when gender is not present" do
    before{ @user.gender = " " }
    it{ should_not be_valid }
  end

  #### session

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end


end