class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  respond_to :html, only: []
  respond_to :xml, only: []

  # skip_before_filter :verify_authenticity_token

  before_action :not_allowed, only: [:new, :edit, :cancel]

  def not_allowed
    raise MethodNotAllowed
  end

  private

  def sign_up_params
    params.require(:user).permit([
      :email,
      :password,
      :password_confirmation,
      :full_name
    ])
  end

  def account_update_params
    params.require(:user).permit([
      :email,
      :full_name
    ])
  end
end
