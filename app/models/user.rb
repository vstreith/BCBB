class User < ApplicationRecord
  has_many :events
  has_many :inscriptions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def voted_for?(event)
    event.inscriptions.where(user: self).any?
  end

end
