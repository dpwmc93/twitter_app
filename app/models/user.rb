class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_one_attached :avatar

  serialize :following, Array

  def full_name
    "#{first_name} #{last_name}"
  end
end
