# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is not a valid email' }
  validates :password, presence: true, length: { minimum: 6, maximum: 25 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 65 }
end
