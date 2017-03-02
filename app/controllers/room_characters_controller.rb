class RoomCharactersController < ApplicationController
  before_action :set_room, only: [:create]

  def new
    @join = RoomCharacter.new
  end

  def create
    @join = Character.find(join_params[:player_id]).campaigns.build(room_id: @room.id)

    if @join.save
      redirect_to @room, notice: 'You have successfully joined the room'
    else
      redirect_to rooms_path, notice: 'You failed to join the room'
    end
  end

  def destroy
    @player = RoomCharacter.find(params[:id])
    @room = Room.find(@player.room_id)

    if @player.destroy
      redirect_to @room, notice: 'Your character has been removed from this room'
    else
      redirect_to @room, notice: 'Could not remove character'
    end
  end

  private
    def set_room
      @room = Room.find(join_params[:room_id])
    end

    def join_params
      params.require(:room_character).permit(:player_id, :room_id)
    end

end
