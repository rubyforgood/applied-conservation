class AdjustUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :project, index: true, null: true, foreign_key: true
  end
end