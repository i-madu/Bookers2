class UsersController < ApplicationController
  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    
  end
  
  def create
    @user = User.new(book_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@user)
    else
      render :show
    end
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
    params.require(:user).permit(:name,:image)
  end
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
   
  
end
