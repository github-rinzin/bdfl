class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_one :outlet,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def toggleBlock
    self.is_blocked = !self.is_blocked
  end


  # super admin
  def is_super_admin 
    self.role_id == Role.sadmin
  end
  # bdfl admin
  def is_admin
    self.role_id == Role.admin
  end
  # customer
  def is_customer
    self.role_id == Role.customer
  end


end
