module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
   def current_pocket
       puts "ここを見ろ"
    #   p params
        puts params[:id]
   #    @current_pocket = Pocket.find_by(params[:id])
       @pocket = Pocket.find(params[:id])
   end
    
    def logged_in?
        !!current_user
    end
end
