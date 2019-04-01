class AddTestsCategoryIdNullConstrait < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column_null(:tests, :category_id, false)
  end

  def down
    change_column_null(:tests, :category_id, true)
  end
end
