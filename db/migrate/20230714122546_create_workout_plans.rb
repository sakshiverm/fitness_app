class CreateWorkoutPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_plans do |t|
      t.text :instructions
      t.references :user

      t.timestamps
    end
  end
end
