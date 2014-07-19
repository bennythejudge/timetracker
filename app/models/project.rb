class Project < ActiveRecord::Base
  belongs_to  :company
  has_many    :works
  has_many    :users, :through => :works
  
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :company, presence: true
  validates :default_rate, numericality: { only_integer: true, 
                                          greater_than: 50,
                                          less_than: 10000 }

  
  scope :illegalrate, -> { where("default_rate < 7.5") }
  scope :minimumwage, -> { where("default_rate == 7.5") }

end
