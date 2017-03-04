class User < ApplicationRecord
  has_secure_password
  validates_presence_of :user
  before_create :generate_confirmation_instructions
  validates_uniqueness_of :user, case_sensitive: true


  def stripUserName
    self.user = self.user.delete(' ')
  end

  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    #self.confirmation_sent_at = Time.now.utc
  end
end
