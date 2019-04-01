class AddTestsLevelDefaultValue < ActiveRecord::Migration[5.2]
  #def change
  #end

  def up
    change_column :tests, :level, :string, default: 'Junior'
  end

  def down
    change_column :tests, :level, :string, default: nil
  end

end
