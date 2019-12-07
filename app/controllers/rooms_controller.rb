class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all.order(:id)
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    room = Room.new(room_params)
  end

  private
  def room_params
    params.require(:room).permit(:id)
  end
end
