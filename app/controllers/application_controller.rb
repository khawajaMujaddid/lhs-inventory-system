class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private
    def after_sign_in_path_for(resource)
      user_index_path
    end
end
