class Team < ApplicationRecord
  has_many :submissions, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :members
  validates_presence_of :wins
  validates :last_year_winner, inclusion: [true, false]
end
