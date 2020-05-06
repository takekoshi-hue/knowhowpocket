class PocketsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update, :edit]

  def destroy
    @pocket.destroy
    flash[:success] = "ポケットを削除しました。"
    redirect_back(fallback_location:root_path)
  end

  def create
    @pocket = current_user.pockets.build(pocket_name_params)
    if @pocket.save
      flash[:success] = "ポケットができました。"
      redirect_to pockets_user_path(current_user.id)
    else
      flash.now[:danger] = "ポケットができませんでした。"
      render :new
  end
end

  def new
     @pocket.new
     @pocket = current_user.pocket_name.build
  end

  def update
    @pocket = Pocket.find_by(id: params[:id])
      if @pocket.update(pocket_name_params)
            flash[:success] = "Pocketが更新されました"
            redirect_to pockets_user_path(current_user.id)
        else
            flash.now[:danger] = "Pocketが更新されませんでした"
            render :edit
        end
  end

  def edit
    @pocket = Pocket.find_by(id: params[:id])
  end
  
  def knowhows
     @knowhow = current_pocket.knowhows.build
    @knowhows = current_pocket.knowhows.order(id: :desc).page(params[:page])
  end
  
  def pocket_name_params
    params.require(:pocket).permit(:pocket_name)
  end
  
  def correct_user
  @pocket = current_user.pockets.find_by(id: params[:id])
  unless @pocket
  redirect_to "sessions/new"
  end
end

 
  private
  
  def current_pocket
        @current_pocket ||= Pocket.find_by(id: :pocket_id)
    end
  
  def knowhow_params
    params.require(:knowhow).permit(:content, :title)
  end
end
