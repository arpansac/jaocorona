class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable, :validatable
  devise :database_authenticatable,
         :recoverable, :rememberable


  enum role: [:admin, :volunteer]

  def admin_permission?
    self.admin?
  end


  def volunteer_permission?
    self.volunteer? || self.admin?
  end

end
