class HorsesController < ApplicationController
    before_action :set_horse, only: [:show, :update, :destroy]

    def index
        horses = Horse.all
        render json: horses, except: [:created_at, :updated_at, :stable_id], include: [:stable]
    end

    # POST /horses
    def create
        horse = Horse.new(horse_params)
        if horse.save
            render json: horse, status: :created, location: horse, except: [:created_at, :updated_at, :stable_id], include: [:stable] 
        else 
            render json: { errors: horse.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # GET /horses/1
    def show
        horse = Horse.find(params[:id])
        # stable = Stable.find(params[:id])
        render json: horse, except: [:created_at, :updated_at, :stable_id], include: [:stable]
    rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
        # byebug
        render json: {message: error.message} #rescue block does not need an 'end'

    end

    #PATCH/PUT /horses/1
    def update
        horse = Horse.find(params[:id])
       if horse.update(horse_params)
        render json: horse, except: [:created_at, :updated_at, :stable_id], include: [:stable] 
        else 
            render json: horse.errors, status: :unprocessable_entity
        end
    end

    # DELETE /horses/1
    def destroy
        horse = Horse.find(params[:id])
        horse.destroy
        # head :no_content
        render json: horse
    # rescue ActiveRecord::RecordNotFound => error #consider putting this in application controller so that all controllers can use it
    #     # byebug
    #     render json: {message: error.message} #rescue block does not need an 'end'
    
    end


    private
    # use callbacks to share common setup or constraints between actions.
    def set_horse
        horse = Horse.find(params[:id])
    end

    def horse_params
        #return only the competitions that haven't taken place yet
        params.require(:horse).permit(
            :name, 
            # :stable_attributes
        )        
    end

end
