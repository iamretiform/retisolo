class SoundsController < ApplicationController
  before_action :set_sounds   
  before_action :set_sound, only: [:show, :edit, :update, :destroy]
  # GET locations/1/sounds
  def index
    @sounds = @location.sounds
  end

  # GET locations/1/sounds/1
  def show
    @sounds = @location.sounds
    @sound = @location.sound
  end

  # GET locations/1/sounds/new
  def new
    @sound = @location.sounds.build
  end

  # GET locations/1/sounds/1/edit
  def edit
  end

  # POST locations/1/sounds

  def create
    sound = Sound.new(sound_params)
    sound.user = current_user
    sound.location = 
    if sound.save
      ActionCable.server.broadcast 'sounds',
          sound: sound.artist_name + sound.title,
          user: sound.user.email
        head :ok
      redirect_to(location_path, notice: 'Sound was successfully created.')
    else
      redirect_to(locations_path, notice: 'Something went wrong when we tried to save your sound. :(')
    end
  end

  # PUT locations/1/sounds/1
  def update
    if @sound.update_attributes(sound_params)
      redirect_to([@sound.location, @sound], notice: 'Sound was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE locations/1/sounds/1
  def destroy
    @sound.destroy

    redirect_to location_url
  end

  private
    def set_sounds  
      @location = Location.find(params[:id])
      @sounds = @location.sounds    
    end   
          
    def set_sound
      @sound = Sound.find(params[:slug])    
    end
      # Only allow a trusted parameter "white list" through.
    def sound_params
      params.require(:sound).permit(:artist_name, :title, :location_id, :user_id)
    end
end
