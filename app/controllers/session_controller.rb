class SessionController < ApplicationController

    def create
            users = User.find_by(username: params[:username])
            if users&.authenticate(params[:password])
                session[:user_id] = users.id
                render json: users, status: :created
            else
                render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end
end
