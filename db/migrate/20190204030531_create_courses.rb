class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :time_spent
      t.boolean :completed
      t.date :date
      t.belongs_to :student, foreign_key: true

      t.timestamps null: true
    end
  end
end
