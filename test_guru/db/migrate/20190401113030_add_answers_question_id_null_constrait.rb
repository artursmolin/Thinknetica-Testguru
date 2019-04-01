class AddAnswersQuestionIdNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:answers, :question_id, false)
  end

  def down
    change_column_null(:answers, :question_id, true)
  end
end
