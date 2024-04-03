class AddExpireDateAndDescriptionToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :expire_date, :date
    add_column :courses, :description, :text
  end
end
