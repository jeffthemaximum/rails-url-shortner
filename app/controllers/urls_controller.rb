class UrlsController < ApplicationController

    def index
        @url = Url.new
    end

    def create
        @url = Url.new(url_params)

        # if user is logged in
        if logged_in?
            @url.user_id = @current_user.id
        end

        @url.save

        redirect_to @url
    end

    def show
        @base_url = request.base_url
        @url = Url.find(params[:id])
    end

    def redirect
        url = Url.find_by! key: params[:key]
        url.hit
        redirect_to url.url
    end

    private
        def url_params
            params.require(:url).permit(:url)
        end

end
