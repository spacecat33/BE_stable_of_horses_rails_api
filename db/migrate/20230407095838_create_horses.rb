class CreateHorses < ActiveRecord::Migration[6.1]
  def change
    create_table :horses do |t|
      t.string :name
      t.belongs_to :stable, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
