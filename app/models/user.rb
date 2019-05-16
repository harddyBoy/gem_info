class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

	has_many :gem_infos


  validates :first_name, :last_name, presence: true, length: { in: 2..25 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

   def send_devise_notification(notification, *args)
		devise_mailer.send(notification, self, *args).deliver_later
  end
end
