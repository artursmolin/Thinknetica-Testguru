class AddTestsLevelNullConstrait < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :level, false)
    add_reference :tests, :category, foreign_key: true
    change_column_default :tests, :level, from: nil, to: 0
  end
end
