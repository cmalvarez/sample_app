module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def current_user=(user) # el nombre del método es current_user=
    @current_user = user # es una asignación equivalente a self.current_user = user
    # es un setter method
  end

  def current_user
    @current_user ||= user_from_remember_token
    # con ||= decomos asignar @current_user siempre y cuando no este previamente asignada
    # este es un getter method
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  private
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
