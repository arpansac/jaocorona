class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end


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
