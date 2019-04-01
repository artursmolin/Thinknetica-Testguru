class AddTestsLevelNullConstrait < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :level, false)
    add_reference :tests, :categories, foreign_key: true
  end

  def up
    change_column_default :tests, :level, from:nil, to: 'Junior'
  end

  def down
    change_column_default :tests, :level, from:'Junior', to: nil
  end
end
