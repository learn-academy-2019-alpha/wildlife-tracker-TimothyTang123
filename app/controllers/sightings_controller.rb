class SightingsController < ApplicationController
    
    def index
        @sighting=Sighting.all
    end

    def new
        animal = Animal.find(params[:animal_id])
        @sighting=animal.sightings.new
    end

    def create
        @sighting=Sighting.new(sightings_params)
        if @sighting.save
            redirect_to animal_path(@sighting.animal)
        else
            render action: :new
        end 
    end

    def edit
        @sighting=Sighting.find(params[:id])
    end

    def update
        @sighting=Sighting.find(params[:id])
        if @sighting.update_attributes(sightings_params)
            redirect_to animal_path(@sighting.animal)
        else 
            render action: :new
        end 
    end 

    def destroy
        @sighting=Sighting.destroy(params[:id])
        if @sighting.destroy
            redirect_to animal_path(@sighting.animal)
        else
            render action: :destroy
        end 
    end 
    
    private
    def sightings_params
        params.require(:sighting).permit(:animal_id, :date, :time, :latitude, :longitude, :region)
    end 

end
