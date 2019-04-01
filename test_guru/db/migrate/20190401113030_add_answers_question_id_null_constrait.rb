class AddAnswersQuestionIdNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:answers, :question_id, false)
    change_column_default :correct, default: false
  end

  def down
    change_column_null(:answers, :question_id, true)
    change_column_default :level, default: nil
  end
end
