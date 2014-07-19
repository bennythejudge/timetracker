class Work < ActiveRecord::Base
  belongs_to  :project
  belongs_to  :user
  
  # hours must be integer and > 0
  validates :hours, numericality: { only_integer: true, 
                                    greater_than: 0, 
                                    less_than_or_equal_to: 8 }
  validates :datetimeperformed, presence: true
  validates :project, presence: true
  validates :user, presence: true
  # notate is validate not validates
  validate :datetimeperformed_cannot_be_in_the_future 
  
  #creating a method on the model that embeds a query
  scope :fullday, -> { where("hours>=8") }
  
  def self.recentdays(numdaysago)
    puts "qui porcoddio con #{numdaysago}"
    since_date = Time.now - numdaysago.to_i.days
    where("datetimeperformed > '#{since_date}")
  end
  
  #helper method for validation
  def datetimeperformed_cannot_be_in_the_future
    if datetimeperformed.present? && datetimeperformed > Time.now 
      errors.add(:datetimeperformed, "cannot be in the future")
    end
  end
  
  
  
end
