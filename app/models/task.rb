class Task < ActiveRecord::Base
  validates :title, presence: true
  validate :future_completed_date

  private
    def future_completed_date
      if !completed.blank? && completed > Date.today
        self.errors.add(:completed, "cant' be in the future")
      end
    end
end
