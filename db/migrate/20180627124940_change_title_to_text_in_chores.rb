class ChangeTitleToTextInChores < ActiveRecord::Migration[5.1]
  def change
    change_column :chores, :title, :text
  end
end
