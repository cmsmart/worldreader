class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable, :lockable

  has_one :profile

  # set roles
  enum role: [:user, :banned, :publisher, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
end
