class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :trainee_id
      t.string :name
      t.integer :reps
      t.float :rep_weight
      t.integer :sets

      t.timestamps
    end
  end
end
