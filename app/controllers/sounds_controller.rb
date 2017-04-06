class SoundsController < ApplicationController
  before_action :set_sounds
  before_action :set_sound, only: [:show, :edit, :update, :destroy]

  # GET locations/1/sounds
  def index
    @sounds = @location.sounds
  end

  # GET locations/1/sounds/1
  def show
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
    @sound = @location.sounds.build(sound_params)

    if @sound.save
      redirect_to([@sound.location, @sound], notice: 'Sound was successfully created.')
    else
      render action: 'new'
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

    redirect_to location_sounds_url(@location)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sounds
      @location = Location.find(params[:location_id])
    end

    def set_sound
      @sound = @location.sounds.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sound_params
      params.fetch(:sound, {})
    end
end
