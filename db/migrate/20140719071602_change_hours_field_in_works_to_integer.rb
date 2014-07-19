# change the works table and change the hours column to integer
class ChangeHoursFieldInWorksToInteger < ActiveRecord::Migration
  def change
    remove_column :works, :hours
    add_column :works, :hours, :integer
  end
end
