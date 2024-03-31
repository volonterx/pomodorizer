class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :slots, array: true, default: Array.new(7, 0)
      t.integer :timer_duration

      t.timestamps
    end
  end
end
