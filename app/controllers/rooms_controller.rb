class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.users.include?(current_user)
      room.destroy
    end
    redirect_to root_path

    # エラーハンドリング・加藤さんならこう書く
    # if room.destroy
    #   redirect_to root_path
    # else
    #   render :index??
    # end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
