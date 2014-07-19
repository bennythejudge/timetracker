class Company < ActiveRecord::Base
  has_many  :users
  has_many  :projects

  # company name must be minimum 5 characters long
  validates :name, length: { minimum: 5 }
end
