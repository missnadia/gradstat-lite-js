class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.belongs_to :course, foreign_key: true
      
      t.timestamps null: true
    end
  end
end
