class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :title
      t.text :email
      t.boolean :status
      t.date :complete_by

      t.timestamps
    end
  end
end
