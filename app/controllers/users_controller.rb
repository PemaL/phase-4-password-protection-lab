class UsersController < ApplicationController

    def create 
        new_user = User.create!(user_params) 
        render json: new_user,status: :created
    end 

    def show 
       user = User.find_by(id: session[:user_id])
       if user
       render json: user,status: :ok 
       else 
        render json: {error: "Unauthorized"}, status: :unauthorized
       end 
    end 

    private 

    def user_params
      params.permit(:username,:password,:password_confirmation)
    end

end 
