class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.references :user
      t.timestamps
    end
  end
end
