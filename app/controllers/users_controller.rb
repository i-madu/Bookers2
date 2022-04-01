class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  before_action :ensuer_guest_user,only: [:edit]

  def index
    @user = current_user
    @books = @user.books
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end
  
  private
  
  def ensuer_guest_user
    @user = User.find(params[id])
    if @user.name == 'guestuser'
    redirect_to user_path(current_user),notice:"ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end


end
