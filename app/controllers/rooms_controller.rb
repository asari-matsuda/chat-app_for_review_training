class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to root_path
  end

  def destroy
    room = Room.find(params[:id])
    room.messages.delete_all
    room.delete
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
