class Answer < ApplicationRecord
  validates :description , presence: true ,length: { maximum: 500 }
  validates :right , presence: true ,inclusion: { in: [true, false] }
  belongs_to :question
end
