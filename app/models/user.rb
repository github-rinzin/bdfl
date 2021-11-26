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


  # admin
  def is_admin 
    self.is_admin
  end
  # customer care
  def is_customer_care
    self.is_customer_care
  end
  # complainer
  def is_complaier
    self.is_complaier
  end


end
