class Submission < ApplicationRecord
  belongs_to :team
  validates_presence_of :title
  validates_presence_of :meat
  validates_presence_of :rub
  validates_presence_of :sauce
  validates_presence_of :cook_time
  validates_presence_of :score
  validates :spicy, inclusion: [true, false]
end
