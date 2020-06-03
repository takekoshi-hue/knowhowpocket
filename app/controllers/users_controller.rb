class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :followings, :followers]
  before_action :current_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @users = User.order(id: :desc).page(params[:page]).per(25)
     @followers = @user.followers.page(params[:page])
    counts(@user)
    @followings = @user.followings.page(params[:page])
    counts(@user)
    
    #@knowhow = Knowhow.find(params[:id])
    @knowhows = @user.likes.page(params[:page])
   
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました。"
      render :new
    end
    
  end

  
  def edit
    @user = User.find(params[:id])
  
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "編集完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "編集できませんでした。"
      render "edit"
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def pockets
     @user = User.find(params[:id])
    @pocket = current_user.pockets.build
    @pockets = current_user.pockets.order(id: :desc).page(params[:page])
  end
  
 private
 
  def correct_user
    @user = current_user
    unless @user
    redirect_back(fallback_location: root_path)
  end
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
