class AddQuestionsTestIdNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:questions, :test_id, false)
  end

  def down
    change_column_null(:questions, :test_id, true)
  end
end
