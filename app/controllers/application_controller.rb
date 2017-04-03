class ApplicationController < ActionController::API
  require 'json_web_token'
  # LOGIN /login
  def login
    user = User.find_by(user: params[:user])

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      user_info = InfoUser.find_by(id: user.info_id)
      notifications_roles = NotificationsRole.where(receiver_id: user.id)
      login_info = {
          :id => user.id,
          :authToken => auth_token,
          :infoId => user.info_id,
          :role => user.role,
          :notificationRoles => notifications_roles,
          :groupRoleId  => user.group_users_id,
          :userName => user_info.name,
          :user => user.user,
          :partPool => user_info.part_of_pool,
          :email => user_info.email,
          :cellphone => user_info.cellphone,
          :bankName => user_info.bank_name,
          :bankClabe => user_info.bank_account,
          :bankAccount => user_info.bank_clabe,
          :paymentMethod => user_info.payment_method,
          :rfc => user_info.rfc
      }

      render json: login_info, status: :ok
    else
      render json: {error: 'Invalid username/password'}, status: :unauthorized
    end
  end

  def confirm
    token = params[:token].to_s

    user = User.find_by(confirmation_token: token)

    if user.present? && user.confirmation_token_valid?
      user.mark_as_confirmed!
      user.password = params[:password]
      user.password_confirmation = params[:password_confirmation]
      if user.save
        render json: {status: 'User account confirmed and password updated successfully'}, status: :ok
      else
        render json: {status: 'There was an error to update the user password'}, status: :internal_server_error
      end
    else
      render json: {status: 'Invalid token'}, status: :not_found
    end
  end

  def forgot_password
    @user = User.find_by(user: params[:user])
    @user_info = InfoUser.find_by user_id: @user.id
    if PostmanMailer.send_password(@user, @user_info).deliver
      render json: {status: 'User\'s password sent.'}, status: :ok
    else
      render json: {status: 'Failed to send the user\'s comments to the admin.'}, status: :internal_server_error
    end
  end

  def suport_comments
    authenticate_request!
    puts "hey"
  end

  protected
  # Validates the token and user and sets the @current_user scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      invalid_authentication
    end
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: {error: 'Invalid Request'}, status: :unauthorized
  end

  private
  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  # Sets the @current_user with the user_id from payload
  #def load_current_user!
  #  @current_user = User.find_by(id: payload[0]['user_id'])
  #end
end
