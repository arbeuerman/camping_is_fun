class Signup < ApplicationRecord
  
  belongs_to :camper
  belongs_to :activity

  validates :hour_of_activity, numericality: { greater_than_or_equal_to: 0 }
  validates :hour_of_activity, numericality: { less_than_or_equal_to: 23 }

end
