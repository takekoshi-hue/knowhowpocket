class KnowhowsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @knowhow = current_pocket.knowhows.build(knowhow_params)
    if @knowhow.save
      flash[:success] = "新しいノウハウができました。"
      redirect_to "knowhows/show"
    else
      flash.now[:danger] = "ノウハウができませんでした。"
      render "pockets/index"
    end
  end

  def destroy
    @knowhow.destroy
    flash[:success] = "ノウハウを削除しました。"
    redirect_to "pockets/index"
  end

  def index
  end

  def show
    @pocket = Pocket.find(params[:id])
    @knowhows = @pocket.knowhows.order(id: :desc).page(params[:page])
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
