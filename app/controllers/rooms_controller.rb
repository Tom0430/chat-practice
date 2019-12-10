class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all.order(created_at: :desc)
    @rooms = Room.page(params[:page]).per(15)
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    if @room.password_digest.present? && session[:authenticated_room] != @room.id
      redirect_to rooms_path
    else
      @messages = @room.messages.last(50)
    end
  end

  def create
    room = Room.new(room_params)
    room.save
    session[:authenticated_room] = room.id
    redirect_to room_path(room.id)
  end

  def input_password
    @room = Room.find(params[:id])
  end

  def authenticate
    room = Room.find(params[:id])
    if room.authenticate(params[:room][:password])
      session[:authenticated_room] = room.id
      redirect_to room_path(room)
    else
      @room = room
      render :input_password
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, :description, :password)
  end
end
