class StablesController < ApplicationController
    def index
        render json: Stable.all, status: :ok
    end

    def create
        stable = Stable.create(stable_params)
        render json: stable, status: :created
    end

    def update
        stable = Stable.find(params[:id])
        stable.update(stable_params)

    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'
    
    end

    def destroy
        stable = Stable.find(params[:id])
        stable.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'
    
    end

    private

    def stable_params
        #return only the competitions that haven't taken place yet
        params.require(:stable).permit(
            :name,
            :location
        )        
    end

end
