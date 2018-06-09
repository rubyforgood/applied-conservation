class AddTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.date :due_on
      t.references :project, :user
      t.timestamps
    end  
  end
end
