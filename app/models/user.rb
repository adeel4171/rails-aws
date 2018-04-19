class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  validates :mobile_number, phone: { possible: false, allow_blank: false, types: [:mobile] }, presence: true
  validates_uniqueness_of :mobile_number
  def needs_mobile_number_verifying?
    if is_verified
      return false
    end
    if mobile_number.nil?
      return false
    end
    return true
  end

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
  
end
