class CreateFitnessActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :fitness_activities do |t|
      t.integer :steps_taken
      t.integer :calories_burned
      t.string :workout_duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
