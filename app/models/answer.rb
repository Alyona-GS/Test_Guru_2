class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_quantity

  scope :correct, -> { where(correct: true) }

  private

  def validate_quantity
    errors.add(:question_id) if question.answers.count >= 4
  end
end
