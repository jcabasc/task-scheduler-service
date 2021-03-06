class Task < ActiveRecord::Base
  has_and_belongs_to_many :servers
  validate :validate_dates
  validate :valid_days
  validates :name, :days_of_week, :executable_path, :started_at, :ended_at, presence: true
  accepts_nested_attributes_for :servers,  allow_destroy: true


  VALID_DAYS = %w(mon tue wed thu fri sat sun)


  def validate_dates
    if self.started_at > self.ended_at
      self.errors[:base] <<  "Start date can't be greater than Finish date"
    end
  end

  def valid_days
    days= self.days_of_week.split(",") & VALID_DAYS
    if days.size == 0
      self.errors[:base] << "Invalid days"
    end

  end

end