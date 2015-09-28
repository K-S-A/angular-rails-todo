class AddStatusToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :status, :string
  end
end
