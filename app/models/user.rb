class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true


  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token # == self.class.new_token
    update_attribute(:remember_digest,
                     User.digest(remember_token)) #== self.class.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # and more to add for remember_digest
end
