class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.datetime :reminder_time

      t.timestamps
    end
  end
end
