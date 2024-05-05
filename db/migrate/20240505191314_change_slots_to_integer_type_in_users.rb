class ChangeSlotsToIntegerTypeInUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :slots
    add_column :users, :slots, :integer, array: true, default: Array.new(7, 0), using: 'ARRAY[slots]::INTEGER[]'
  end

  def down
    remove_column :users, :slots
    add_column :user, :slots, :text, array: true, default: Array.new(7, 0)
  end
end
