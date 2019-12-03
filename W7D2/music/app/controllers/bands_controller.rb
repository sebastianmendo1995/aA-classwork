class BandsController < ApplicationController

    def index
        @bands = Band.all 
        render :index
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.safe
            redirect_to band_url(@band)
        else
            flash.now[:error] = @band.error.full_messagges
            render :new
        end
    end

    def edit
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update
            redirect_to band_url(@band)
        else
            flash.now[:error] = @band.error.full_messagges
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:album).permit(:name)
    end

end
