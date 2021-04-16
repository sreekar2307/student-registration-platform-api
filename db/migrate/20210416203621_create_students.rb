class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :enrollment_no, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :degree
      t.string :courses, default: [], array: true
      t.timestamps
    end
  end
end
