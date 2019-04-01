class AddAnswersQuestionIdNullConstrait < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :questions, foreign_key: true
  end

  def up
    change_column_default :answers, :correct, :boolean, from:nil, to: false
  end

  def down
    change_column_default :answers, :correct, :boolean, from:false, to: nil
  end
end
