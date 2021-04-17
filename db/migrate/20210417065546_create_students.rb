class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :enrollment_no, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :name, null: false
      t.belongs_to :degree, foreign_key: true

      t.timestamps
    end
  end
end
