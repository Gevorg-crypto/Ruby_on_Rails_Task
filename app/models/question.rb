class Question < ApplicationRecord
  #  Validation
  validates :description , presence: true ,length: { maximum: 500 }
  validates :point , presence: true ,numericality: true
  validates_associated :answers
  # Association
  has_many :answers ,dependent: :destroy
  accepts_nested_attributes_for :answers, :allow_destroy => true
end
