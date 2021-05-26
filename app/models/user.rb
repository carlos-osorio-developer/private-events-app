class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:login]

  attr_accessor :login
  
  before_validation do
    self.password = "123456"
    self.password_confirmation = "123456"
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
  end
end
