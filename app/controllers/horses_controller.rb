class HorsesController < ApplicationController

    def index
        render json: Horse.all, status: :ok
    end

    def create
        horse = Horse.create(horse_params)
        render json: horse, status: :created
    end

    def show
        horse = Horse.find(params[:id])
        stable = Stable.find(params[:id])
        render json: horse, status: :ok
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'

    end

    def update
        horse = Horse.find(params[:id])
        horse.update(horse_params)

    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'
    
    end

    def destroy
        horse = Horse.find(params[:id])
        horse.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'
    
    end

    private

    def horse_params
        #return only the competitions that haven't taken place yet
        params.require(:horse).permit(
            :name
        )        
    end

end
