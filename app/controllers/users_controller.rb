class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

def show
	  @user = User.find(params[:id])
  	@book = Book.new
  	@books = Book.all
end

def edit
	@user = User.find(current_user.id)
end

def update
	@user = User.find(current_user.id)
	if @user.update(user_params)
	redirect_to user_path(@user.id), notice:'update user successfully'
    else
    	render "edit"
    end
end

def index
	@user = User.find(current_user.id)
	@users = User.all
	@book = Book.new
end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
  	end
  end

end