class AddAnswersQuestionIdNullConstrait < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :question_id, false)
  end

  def up
    change_column :answers, :correct, :boolean, from:nil, to: false
  end

  def down
    change_column :answers, :correct, :boolean, from:false, to: nil
  end
end
