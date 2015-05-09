class RemoveDueDateFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :due_date, :datetime
    add_column :tasks, :due_date, :date
  end
end
