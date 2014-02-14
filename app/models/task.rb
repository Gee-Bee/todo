class Task < ActiveRecord::Base

  belongs_to :user

  validates :title, :user, presence: true
  validate :future_completed_date

  private
    def future_completed_date
      if !completed.blank? && completed > Date.today
        self.errors.add(:completed, "cant' be in the future")
      end
    end
end
