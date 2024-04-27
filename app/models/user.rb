class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :registerable,
  devise :database_authenticatable,
         :recoverable, :validatable

  belongs_to :account
end
