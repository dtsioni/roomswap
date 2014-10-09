class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update, :edit]

  def show
    
  end

  def new
    @user = User.new    
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    # set university to Rutgers for now
    # if adding university expandability, put university selection in form and add to user_params
    @user.university = University.default    
    respond_to do |format|
      if @user.save
        sign_in @user
        format.html{ redirect_to @user }
        flash[:success] = "Welcome!"
      else
        format.html{ render :new }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{ redirect_to @user }
        flash[:success] = "User was successfully updated!"
      else
        format.html{ render :edit }
        flash.now[:error] = "User was not successfully updated."
      end
    end
  end

  def destroy
    name = @user.name
    @user.destroy
    respond_to do |format|
      format.html{ redirect_to root_path }
      flash[:success] = "#{name} was successfully destroyed."
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :gender)
    end
end