class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete

      t.timestamps
    end
  end
end
