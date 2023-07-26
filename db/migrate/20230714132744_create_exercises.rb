class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.references :workout_plan

      t.timestamps
    end
  end
end
