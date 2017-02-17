class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :stats
      t.integer :uses
      t.integer :gold_value
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
