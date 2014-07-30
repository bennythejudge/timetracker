class Project < ActiveRecord::Base
  belongs_to  :company
  has_many    :works
  has_many    :users, :through => :works
  # adding as a consequence of adding a user_id column to the projects table
  belongs_to  :user
  
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  # not working..
  #validates :name, uniqueness: true
  validates :company_id, presence: true
  validates :default_rate, numericality: { only_integer: true, 
                                          greater_than: 8,
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

  # class method to export projects in CSV format
  # it expects a collection (@project)
  # the << adds to the csv entity
  def self.export_csv(projects)
    puts "HERE CSV"
    myCols = []
    CSV.generate do |csv|
      csv << [ 'name', 'company','default_rate','created_at','owner','most recent work item']
      projects.each do |p|
        csv << [ p.name, p.company,p.default_rate,p.created_at,p.user,p.works.last]
      end
    end
  end
end
