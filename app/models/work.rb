class Work < ActiveRecord::Base
  belongs_to  :project
  belongs_to  :user
  
  # hours must be integer and > 0
  validates :hours, numericality: { only_integer: true, 
                                    greater_than: 0, 
                                    less_than_or_equal_to: 8 }
  validates :datetimeperformed, presence: true
  validates :project_id, presence: true
  validates :user_id, presence: true
  # notate is validate not validates
  validate :datetimeperformed_cannot_be_in_the_future 
  
  #creating a method on the model that embeds a query
  scope :fullday, -> { where("hours>=8") }
  
  def self.recentdays(numdaysago)
    since_date = Time.now - numdaysago.to_i.days
    #puts "debugging: #{since_date}"
    where("datetimeperformed > '#{since_date}'")
  end
  
  #helper method for validation
  def datetimeperformed_cannot_be_in_the_future
    if datetimeperformed.present? && datetimeperformed > Time.now 
      errors.add(:datetimeperformed, "cannot be in the future")
    end
  end
  
  def to_s
    "#{user}: #{datetimeperformed.strftime('%Y-%m-%d %H:%M')} - #{hours}hrs"
  end
end
