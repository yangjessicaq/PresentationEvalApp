class Presentation < ApplicationRecord
  has_many :grades, dependent: :destroy

  def formatted_start_time
    present_start_time.strftime("%-I:%M %p") if present_start_time
  end

  def formatted_end_time
    present_end_time.strftime("%-I:%M %p") if present_end_time
  end

  def formatted_date
    present_date.strftime("%-m/%-d/%Y")
  end

  def full_name(email)
    user = User.find_by(email: email)
    user.present? ? user.full_name : nil
  end
end
