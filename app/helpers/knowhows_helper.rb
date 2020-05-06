module KnowhowsHelper
    def current_pocket
        @current_pocket ||= Pocket.find_by(params[:id])
    end
end
