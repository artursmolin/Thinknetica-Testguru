class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create

  before_save :next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end
    save!
  end

  def correct_answers
    current_question.answers.right
  end

  def current_question_index
    index = 1
    if self.current_question.nil?
      index = 1
    else
      index +=1
    end
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id >?', current_question.id).first
  end


end
