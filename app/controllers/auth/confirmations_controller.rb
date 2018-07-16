class Auth::ConfirmationsController < Auth::BaseController
  def new
      confirmed_and_or_redirect(params[:token]) if params[:token].present?
  end



private
  def confirmed_and_or_redirect(token)
    user =  User.where(confirmation_token: params[:token]).first
    if session[:user_id].present?
      redirect_to root_path, info: 'You are already login!'
    elsif user and user.confirmed?
      redirect_to login_path, info: 'Email already confirmed please login!'
    elsif user and not user.confirmed?
      user.update_attributes(confirmed_at: DateTime.now)
      session[:user_id] = user.id
      redirect_to root_path, success: 'Thank you for confirming your email!'
    else
      redirect_to login_path, warning: 'Invalid token!'
    end
  end
end
