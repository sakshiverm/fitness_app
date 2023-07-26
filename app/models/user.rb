class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  has_many :challenges
  has_many :goals
  has_many :fitness_activities
  has_many :workout_plans
  has_many :notifications
  has_many :reminders
end
