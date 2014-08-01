class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to  :company
  has_many    :works
  has_many    :projects, :through => :works
  has_many    :projects_owned, :foreign_key => 'owner_id', :class_name => 'Project'
  
  # adding as a consequence of adding a user_id column to the projects table
  has_many    :projects
  
  validates :lname, length: { minimum: 5 }
  validates :fname, length: { minimum: 2 }
  validates :company, presence: true
  
  def to_s
    "#{fname} #{lname}"
  end
end
