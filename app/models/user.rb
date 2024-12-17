class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, 
    length: { minimum: 6 }, 
    format: {
      with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).*/,
      message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character."
    },
    if: :password
  validates :password_confirmation, presence: true, if: :password

  def full_name
    first_name + " " + last_name
  end

  def instructor?
    role == "Instructor"
  end

  def student?
    role == "Student"
  end
end
