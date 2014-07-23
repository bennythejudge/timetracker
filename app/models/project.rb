class Project < ActiveRecord::Base
  belongs_to  :company
  has_many    :works
  has_many    :users, :through => :works
  
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  # not working..
  #validates :name, uniqueness: true
  validates :company_id, presence: true
  validates :default_rate, numericality: { only_integer: true, 
                                          greater_than: 50,
                                          less_than: 10000 }
  # adding validation for new column slug
  validates :slug, presence: true
  validates :slug, length: { minimum: 3 }
  validates :slug, uniqueness: true
  
  
  scope :illegalrate, -> { where("default_rate < 7.5") }
  scope :minimumwage, -> { where("default_rate == 7.5") }
  
  # adding a method to render the project
  def to_s
    "#{name} (#{company})"
  end

end
