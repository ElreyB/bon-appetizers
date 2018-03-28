class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events

  validate :password_complexity
  validates :phone, presence: true

  def self.get_fullname(user_id)
    user = User.find(user_id)
    "#{user.first_name} #{user.last_name}"
  end


  def password_complexity

    # PASSWORD_FORMAT = /\A
    #   (?=.{6,})          # Must contain 6 or more characters
    #   (?=.*\d)           # Must contain a digit
    #   (?=.*[a-z])        # Must contain a lower case character
    #   (?=.*[A-Z])        # Must contain an upper case character
    #   (?=.*[[:^alnum:]]) # Must contain a symbol
    # /x

    if password.present? and not password.match(/\A(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/)
      errors.add :password, "must contain at least 6 characters, a number, a lowercase letter, uppercase letter, a symbol"
    end
  end
end
