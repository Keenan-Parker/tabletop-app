class RoomCharactersController < ApplicationController

  def new
    @join = RoomCharacter.new
  end

  def create
    @room = Room.find(join_params[:room_id])

    @join = Character.find(join_params[:player_id]).campaigns.build(room_id: @room.id)

    if @join.save
      redirect_to @room, notice: 'You have successfully joined the room'
    else
      redirect_to rooms_path, notice: 'You failed to join the room'
    end
  end

  private

    def join_params
      params.require(:room_character).permit(:player_id, :room_id)
    end
end
