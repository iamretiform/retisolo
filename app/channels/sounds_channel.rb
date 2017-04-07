class SoundsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'sounds'
  end
end  