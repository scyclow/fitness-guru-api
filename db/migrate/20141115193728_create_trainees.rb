class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.integer :trainer_id
      t.string :name
      t.string :height
      t.float :weight
      t.text :bio

      t.timestamps
    end
  end
end
