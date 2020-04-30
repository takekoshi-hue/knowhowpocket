class PocketsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update, :edit]
  
  def index
    @pockets = current_user.pocket_name.order(id: :desc).page(params[:page])
  end

  def show
  end

  def destroy
    @pocket.destroy
    flash[:success] = "ポケットを削除しました。"
    redirect_to "pockets/index"
  end

  def create
    @pocket = current_user.pockets.build(pocket_name_params)
    if @pocket.save
      flash[:success] = "ポケットができました。"
      redirect_to "pockets/index"
    else
      flash.now[:danger] = "ポケットができませんでした。"
      render "pockets/new"
    
  
  end

  def new
     @pocket.new
     @pocket = current_user.pocket_name.build
  end

  def update
  end

  def edit
  end
  
  def pocket_name_params
    params.require(:pocket).permit(:pocket_name)
  end
  
  def correct_user
  @pocket = current_user.pockets.find_by(id: prams[:id])
  unless @pocket
  redirect_to "sessions/new"
 end
end
