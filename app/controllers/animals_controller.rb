class AnimalsController < ApplicationController
    
    def index
        @animals=Animal.all
    end
    
    def new
        @animals= Animal.new
    end
    
    def create
        @animals = Animal.new(animal_params)
        if @animals.save
            redirect_to animals_path
        else
            render action: :new
        end
    end
    
    def edit
        @animal=Animal.find(params[:id])
    end
    
    def update
        @animal =Animal.find(params[:id])
        if @animal.update_attributes(animal_params)
            redirect_to animals_path(@animal)
        else
            render action: :edit
        end
    end
    
    def destroy
        @animal=Animal.destroy(params[:id])
        if @animal.destroy
            redirect_to animals_path
        else
            render :destroy
        end 
    end
    
    def show 
        @animal=Animal.find(params[:id])
    end 
    
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
end

