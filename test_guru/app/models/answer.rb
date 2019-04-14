class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true)}

  validates :body, presence:true, uniqueness:true
  validate :answers_quantity, on: :create

  def answers_quantity
    errors.add(:question_id, "more than 4 answers") if
      question.answer.size >= 4
  end
end
