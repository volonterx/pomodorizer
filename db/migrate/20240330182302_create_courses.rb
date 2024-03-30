class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :url
      t.integer :duration
      t.date :start_date
      t.integer :priority

      t.timestamps
    end
  end
end
