class AddTestsCategoryIdNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:tests, :category_id, false)
    change_column_default :level, default: 'Junior'
  end

  def down
    change_column_null(:tests, :category_id, true)
    change_column_default :level, default: nil
  end
end
