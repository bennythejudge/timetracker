class User < ActiveRecord::Base
  belongs_to  :company
  has_many    :works
  has_many    :projects, :through => :works
  
  validates :lname, length: { minimum: 5 }
  validates :fname, length: { minimum: 2 }
  validates :company, presence: true
  
  def to_s
    "#{fname} #{lname}"
  end
end
