class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
        @characters = current_user.characters
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = current_user.characters.build
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create

    initiative_bonus = set_initiative
    updated_params = character_params.merge(initiative: initiative_bonus)
    @character = current_user.characters.build(updated_params)
    # @character = current_user.characters.build.(character_params)
    # take a look at what params gives you
    # define a method to do the math on your values
    # pass new value back into params before saving

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update

    initiative_bonus = set_initiative
    updated_params = character_params.merge(initiative: initiative_bonus)

    respond_to do |format|
      if @character.update(updated_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

   def set_initiative
     dex_mod = character_params[:dexterity].to_i / 2 - 5
     if character_params[:improved_initiative] == "1"
       initiative_bonus = dex_mod.to_i + character_params[:level].to_i + 4
     else
       initiative_bonus = dex_mod.to_i + character_params[:level].to_i
     end
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
       params.require(:character).permit(:name, :race, :job, :level, :strength, :constitution, :dexterity, :intelligence, :wisdom, :charisma, :armor_class, :phys_def, :mental_def, :hit_points, :recoveries, :recovery_dice, :one_unique_thing, :icons, :backgrounds, :racial, :class_features, :talents, :melee_atk, :ranged_atk, :powers, :feats, :improved_initiative, :equipment, :gold, :initiative, :user_id)
    end
end
