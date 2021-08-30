class SessionsController < Clearance::SessionsController

    def create
        @user = authenticate(params)

        sign_in(@user) do |status|
            if status.success?
                redirect_back_or url_after_create
            else
                flash.now.alert = 'Username or password incorrect.' #status.failure_message
                render template: "sessions/new", status: :unauthorized
            end
        end
    end

    def authenticate(params)
        Clearance.configuration.user_model.authenticate(
            params[:session][:username], params[:session][:password]
        )
    end

end