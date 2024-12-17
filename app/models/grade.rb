class Grade < ApplicationRecord
  belongs_to :presentation
  belongs_to :grader, class_name: 'User', foreign_key: "grader_id"

  validates :presentation_id, :grader_id, :grader_name, :grade_value, presence: true
  validates :grade_value, format: { with: /\A[0-9]{1,3}\z/, message: "must be a number between 0 and 100" }, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :comments, length: { minimum: 0, maximum: 500 }
end
