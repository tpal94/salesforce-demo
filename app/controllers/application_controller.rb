class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def salesforce 
    @restforce ||= Restforce.new :oauth_token => current_user.oauth_token,
      :refresh_token           => current_user.refresh_token,
      :instance_url            => current_user.instance_url,
      :client_id               => "3MVG9d8..z.hDcPJdC6xX0F6SXP2z4ZHawGLQT1gBoipFca5Kl2VG0qfzafL_GUJcJNkFG96F1b10aGuOAG1H",
      :client_secret           => "1068394594778656929",
      :authentication_callback => Proc.new {|x| Rails.logger.debug x.to_s}
  end
end
