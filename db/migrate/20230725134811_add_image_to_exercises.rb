class AddImageToExercises < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :image, :string
  end
end
