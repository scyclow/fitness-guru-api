class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :trainee_id
      t.string :name
      t.integer :calories

      t.timestamps
    end
  end
end
