class Todo < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: {scope: :user_id, case_sensitive: false}
  validates :description, length: { in: 10..255 }
  validates :priority, inclusion: { in: 0..5 }
  validates :status, inclusion: { in: %w(active finished) }
  validates_date :due_date, on_or_after: :today

end
