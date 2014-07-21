class Company < ActiveRecord::Base
  has_many  :users
  has_many  :projects

  # company name must be minimum 5 characters long
  validates :name, length: { minimum: 5 }
  
  # any reference to company will be replaced by the value
  # returned
  def to_s
    name
  end
end
