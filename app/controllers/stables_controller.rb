class StablesController < ApplicationController
    before_action :set_stable, only: [:show, :update, :destroy]

    def index
        render json: Stable.all, status: :ok, include: [:horses]
    end

    def create
        # byebug
        stable = Stable.new(stable_params)
        # horse = Horse.new(horse_params)
        if stable.save
            render json: stable, status: :created
        else 
            render json: { errors: stable.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        stable = Stable.find(params[:id])
        horse = Horse.find(params[:id])
        render json: stable, except: [:created_at, :updated_at], status: :ok
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'

    end

    def update
        stable = Stable.find(params[:id])
        if stable.update(stable_params)
            render json: stable, status: :ok
        else
            render json: stable.errors, status: :unprocessable_entity
        end
    end

    def destroy
        stable = Stable.find(params[:id])
        # byebug
        stable.destroy
        # head :no_content
        render json: stable
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'
    end

    private

    # use callbacks to share common setup or constraints between actions.
    def set_stable
        # binding.pry
        stable = Stable.find(params[:id])
    end

    def stable_params
        params.require(:stable).permit(:name, horses_attributes:[
            # :horse
            :name
            # :horses
            # name: horse_name
        ])        
    end

end
