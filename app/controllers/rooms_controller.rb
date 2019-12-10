class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all.order(created_at: :desc)
    @rooms = Room.page(params[:page]).per(15)
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.last(50)
  end

  def create
    room = Room.new(room_params)
    room.save
    redirect_to room_path(room.id)
  end

  def input_password
    @room = Room.find(params[:id])
  end

  def authenticate
    room = Room.find(params[:id])
    if room.authenticate(params[:room][:password])
      redirect_to room_path(room)
    else
      @room = room
      render :input_password
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :password, :password_confirmation)
  end
end
