class UrlsController < ApplicationController

    def index
        @url = Url.new
    end

    def create
        @url = Url.new(url_params)
        @url.save
        redirect_to @url
    end

    def show
        @base_url = request.base_url
        @url = Url.find(params[:id])
    end

    def redirect
        url = Url.find_by! key: params[:key]
        redirect_to url.url
    end

    private
        def url_params
            params.require(:url).permit(:url)
        end

end
