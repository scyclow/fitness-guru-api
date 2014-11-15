class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!, :except => :cors_preflight_check

  after_filter :set_cors_headers

  rescue_from(Exception) do |e|
    set_cors_headers
    Rails.logger.debug(e.message)
    Rails.logger.debug(e.backtrace.join("\n"))
    render_error({ :error => e.message }, 500)
  end

  def cors_preflight_check
    render :text => '', :content_type => 'text/plain'
  end

  def render_error message_json, status = 400
    set_cors_headers
    render :json => message_json, :status => status
  end

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Headers'] = 'api_token, Content-Type'
    headers['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE'
  end

  # TokenAuthenticatable is no longer supported in Devise -
  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  def authenticate_user_from_token!
    # user_id = params[:user_id].presence
    # user = user_id && User.find(user_id)
    # api_token = params[:api_token] || env['HTTP_API_TOKEN']
    # if user && Devise.secure_compare(user.api_token, api_token)
    #   sign_in user, store: false and return
    # end

    # render_error({ :error => "Please sign in first." })
  end
end
