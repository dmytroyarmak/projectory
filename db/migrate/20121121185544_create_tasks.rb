class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.boolean :done
      t.date :deadline
      t.integer :project_id

      t.timestamps
    end
  end
end
