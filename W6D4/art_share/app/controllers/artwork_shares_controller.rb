class ArtworkSharesController < ApplicationController
    def index
        artwork_shares = ArtworkShare.all
        render json: artwork_shares
    end

    def create
        
        artwork_share = ArtworkShare.new(artwork_share_params)
        artwork_share.save!
        render json: ArtworkShare.all
        # if artwork_share.save
        #     render json: artwork_share
        # else
        #     render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        # end
        
    end

    def show
        artwork_share = ArtworkShare.find(params[:id])
        if artwork_share
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 404
        end
    end

    def update
        artwork_share = ArtworkShare.find(params[:id])
        if artwork_share.update(artwork_share_params)
            redirect_to artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 418
        end
    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.destroy
        render json: ArtworkShare.all

    end

    private
    def artwork_share_params 
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
