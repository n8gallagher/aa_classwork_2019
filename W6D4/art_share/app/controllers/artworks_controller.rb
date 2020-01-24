class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
    end

    def create
        
        artwork = Artwork.new(artwork_params)
        artwork.save!
        render json: Artwork.all
        # if artwork.save
        #     render json: artwork
        # else
        #     render json: artwork.errors.full_messages, status: :unprocessable_entity
        # end
        
    end

    def show
        artwork = Artwork.find(params[:id])
        if artwork
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 404
        end
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork
        else
            render json: artwork.errors.full_messages, status: 418
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: Artwork.all

    end

    private
    def artwork_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
