class User < ApplicationRecord
  # before_action :authenticate_user!
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods
  has_many :recipes
  has_many :foods, foreign_key: 'user_id'
end
