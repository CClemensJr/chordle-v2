class ChangeTimeToCompleteToStringInChores < ActiveRecord::Migration[5.1]
  def change
    change_column :chores, :time_to_complete, :string
  end
end
