class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  attr_accessible :email, :password, :password_confirmation

  validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is not formatted properly" }, unless: :guest?
  validates_uniqueness_of :email, allow_blank: true

  validates_presence_of :password_digest, unless: :guest?
  validates_confirmation_of :password

  # override has_secure_password to customize validation until Rails 4.
  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation

  def self.new_guest
    new { |u| u.guest = true}    
  end

  def name
    guest ? "Guest" : email    
  end

  def move_to(user)
    projects.update_all(user_id: user.id)
  end
end