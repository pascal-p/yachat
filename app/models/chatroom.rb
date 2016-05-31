class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  validates :topic, presence: true, uniqueness: true, case_sensitive: false

  attr_accessor :slug

  before_validation :sanitize, :slugify

  def to_param
    self.slug
  end

  def sanitize
    self.topic.strip!            # remove extra space
    self.topic.gsub!(/\s+/, ' ') # multiple space replaced by one
    self.topic.capitalize!
  end

  def slugify
    self.slug = self.topic.gsub(" ", "-")
  end

  def self.unslugify(slug)
    slug.gsub("-", " ")
  end

  #def to_h
  #  { chatroom: {id: self.id, topic: self.topic, slug: self.slug }}
  #end

end
