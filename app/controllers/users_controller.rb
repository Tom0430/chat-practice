class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to rooms_path
        else
            render action: "new"
        end
    end

    def google_login
        user = User.find_or_create_by(uid: request.env['omniauth.auth']['uid'] )
        if user.name.blank?
            user.name = request.env['omniauth.auth']['info']['name']
            user.email = request.env['omniauth.auth']['info']['email']
            user.uid = request.env['omniauth.auth']['uid']
            user.save
        end
        log_in(user)
        redirect_to rooms_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :last_sending_time)
    end
end
