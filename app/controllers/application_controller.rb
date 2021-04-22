class ApplicationController < ActionController::Base



  def admin_permission?
    if !(user_signed_in? && current_user.admin?)
      return render json: {message: "Unauthorized"}, status: 401
    end

    true
  end


  def volunteer_permission?
    if !(user_signed_in? && (current_user.volunteer? || current_user.admin?))
      return render json: {message: "Unauthorized"}, status: 401
    end

    true
  end
end
