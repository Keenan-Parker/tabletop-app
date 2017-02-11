class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :job
      t.integer :level
      t.integer :strength
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :armor_class
      t.integer :phys_def
      t.integer :mental_def
      t.integer :hit_points
      t.integer :recoveries
      t.string :recovery_dice
      t.string :one_unique_thing
      t.string :icons
      t.string :backgrounds
      t.string :racial
      t.string :class_features
      t.string :talents
      t.string :melee_atk
      t.string :ranged_atk
      t.string :powers
      t.string :feats
      t.boolean :improved_initiative
      t.string :equipment
      t.integer :gold
      t.integer :initiative
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
