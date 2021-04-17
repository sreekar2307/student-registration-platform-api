class AddDegreeIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :courses, :degree, null: false, foreign_key: true
  end
end
