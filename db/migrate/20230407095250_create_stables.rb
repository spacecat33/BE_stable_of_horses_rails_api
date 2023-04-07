class CreateStables < ActiveRecord::Migration[6.1]
  def change
    create_table :stables do |t|
      t.string :name

      t.timestamps
    end
  end
end
