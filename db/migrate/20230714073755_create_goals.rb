class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.string :duration
      t.string :weight_loss
      t.references :user

      t.timestamps
    end
  end
end
