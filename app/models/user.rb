class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true

  attr_accessor :remember_me, :remember_token
  # remember_me is a pseudo attr for the form (view)
  # remember_token (clear) and remember_digest (enrypted and persisted in the DB)

  before_save :normalize_username!
  
  class << self
    #
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    #
    # Returns a random token (22 chars long - default)
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  #
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = self.class.new_token
    update_attribute(:remember_digest, self.class.digest(remember_token))
  end

  #
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  #
  # Returns true if the given token matches the digest, cf. (1)
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token) # (1)
  end

  private
  def normalize_username
    self.username.capitalize!
  end
  
end
