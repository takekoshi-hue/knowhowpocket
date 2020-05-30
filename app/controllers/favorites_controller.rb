class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    knowhow = Knowhow.find(params[:knowhow_id])
    current_user.favorite(knowhow)
    flash[:success] = "ポケットしました。"
    redirect_to user_path(current_user.id)
  end

  def destroy
     knowhow = Knowhow.find(params[:knowhow_id])
    current_user.unfavorite(knowhow)
    flash[:success] = "ポケットをやめました。"
    redirect_to user_path(current_user.id)
  end
end


  