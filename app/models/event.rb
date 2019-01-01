class Event < ApplicationRecord
  belongs_to :user
  has_many :inscriptions
  validates :name, presence: true, uniqueness: true
  validates :event_type, inclusion: { in: %w(Interclub Général Tournoi), message: "%{value} n'est pas une catégorie valide"}
  validates :date, presence: true
end
