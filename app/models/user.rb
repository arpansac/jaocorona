class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :validatable, :recoverable
  devise :database_authenticatable, :rememberable


  enum role: [:admin, :volunteer]

  def admin_permission?
    self.admin?
  end


  def volunteer_permission?
    self.volunteer? || self.admin?
  end

end
