class KnowhowsController < ApplicationController
  before_action :require_user_logged_in


  
  def destroy
    @knowhow = Knowhow.find(params[:id])
    @knowhow.destroy
    flash[:success] = "ポケットを削除しました。"
    redirect_back(fallback_location:root_path)
  end

  def create
    puts "ここを見ろ"
    p params
    @pocket = Pocket.find(params[:id])
    @knowhow = @pocket.knowhows.build(knowhow_params)
    if @knowhow.save
      flash[:success] = "ノウハウができました。"
      redirect_to  knowhows_pocket_path(@pocket)
      
    else
      flash.now[:danger] = "ノウハウができませんでした。"
      render :new
  end
end

 

  def update
     @knowhow =  Knowhow.find(params[:id])
      if @knowhow.update(knowhow_params)
            flash[:success] = "ノウハウが更新されました"
            redirect_to knowhow_path(@knowhow)
        else
            flash.now[:danger] = "ノウハウが更新されませんでした"
            render "edit"
        end
  end

  def edit
  @knowhow =  Knowhow.find(params[:id])
  end
  
  def show
    @knowhow = Knowhow.find(params[:id])
  end
  
  def knowhow_posted
  	  @knowhow = Knowhow.find(params[:id])
	  @knowhow.posted = !@knowhow.posted
	  @knowhow.save
	end
	
	

 
  private
  
   def correct_pocket
       @pocket = Pocket.find(params[:id])
  @knowhow = @pocket.knowhows.find_by(id: params[:id])
end
  
  def knowhow_params
    params.require(:knowhow).permit(:content, :title, :posted)
  end
end
