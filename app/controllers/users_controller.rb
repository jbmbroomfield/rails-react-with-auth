class UsersController < Clearance::UsersController

    def create
        @user = user_from_params

        if @user.save
            sign_in @user

            # unique tasks I needed done went in here

            redirect_back_or url_after_create
        else
            render template: "users/new"
        end
    end

    private

    def user_params
        params[:user] ? params[:user].permit(:email, :password, :username) : {}
    end

end