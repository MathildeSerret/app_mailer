class User < ApplicationRecord
	has_many :attendance
	has_many :events, through: :attendance
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end

