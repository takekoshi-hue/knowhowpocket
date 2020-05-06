class KnowhowsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @knowhow = pocket.knowhows.build(title_params, content_params)
    if @knowhow.save
      flash[:success] = "新しいノウハウができました。"
      redirect_to knowhows_pocket_path(pocket.id)
    else
      flash.now[:danger] = "ノウハウができませんでした。"
      render :new
    end
  end

  def destroy
    @knowhow.destroy
    flash[:success] = "ノウハウを削除しました。"
    redirect_to "pockets/index"
  end


  def show
    @knowhow = current_pocket.knowhows.build
    @knowhows = current_pocket.knowhows.order(id: :desc).page(params[:page])
  end

  def edit
  end

  def new
  end

  def update
  end
  
  private
  
  def knowhow_params
    params.require(:knowhow).permit(:content, :title)
  end
  
  def correct_user
    @knowhow = correct_pocket.knowhows.find_by(id: params[:id])
    unless @knowhow
    redirect_back
    end
  end
  
end
