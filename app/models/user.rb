class User < ApplicationRecord
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&]).{10,}\z/


  validates :username, presence: true, uniqueness: true
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: 10 },
    format: {
      with: VALID_PASSWORD_REGEX,
      message: 'must include at least an uppercase letter, a number, and a special character (!@#$%^&*).'
    }
end
