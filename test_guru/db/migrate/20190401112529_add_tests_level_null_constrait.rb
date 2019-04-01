class AddTestsLevelNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:tests, :level, false)
  end

  def down
    change_column_null(:tests, :level, true)
  end
end
