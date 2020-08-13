class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    include Pundit

    # called before every action on controllers
    before_action :authorize_request

    # un comment this to ensure that you have added authorize to all actions, also we can specify which methods to be excluded or included
    # after_action :verify_authorized, except: :index
    # after_action :verify_policy_scoped, only: :index

    attr_reader :current_user

    private

    # Check for valid request token and return user
    def authorize_request
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
