class ChangeColumnNameFromTitleToDescriptionInChores < ActiveRecord::Migration[5.1]
  def change
    rename_column :chores, :title, :description
  end
end
