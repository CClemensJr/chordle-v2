class CreateChores < ActiveRecord::Migration[5.1]
  def change
    create_table :chores do |t|
      t.string :title
      t.integer :time_to_complete
      t.string :priority
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :chores, [:user_id, :created_at]
  end
end
