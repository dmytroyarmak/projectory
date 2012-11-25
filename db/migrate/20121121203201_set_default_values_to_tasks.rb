class SetDefaultValuesToTasks < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.change :priority, :integer, :default => 0
      t.change :done, :boolean, :default => false
    end  
  end

  def down
    change_table :tasks do |t|
      t.change :priority, :integer
      t.change :done, :boolean
    end
  end
end
