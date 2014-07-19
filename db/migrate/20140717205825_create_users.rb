class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :fname
      t.string  :lname
      t.integer :company_id
      t.timestamps
    end
  end
end
