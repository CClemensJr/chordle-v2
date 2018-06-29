class ChangeTimeToCompleteToIntegerInChores < ActiveRecord::Migration[5.1]
  def change
    change_column :chores, :time_to_complete, :integer
  end
end
