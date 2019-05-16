class AddAnswersQuestionIdNullConstrait < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, foreign_key: true
    change_column_default :answers, :correct, from: nil, to: true
  end
end
