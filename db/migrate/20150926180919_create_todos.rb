class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.date :due_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
