class UsersController < ApplicationController
    before_action :logged_in?, :current_user, :not_authorized, except: [:new, :create]
    def new 
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            flash[:notice] = "User creation was Successful!"
            set_session
            redirect_to @user
        else
            render :new
        end
    end
    
    def update
        if @user.update(user_params)
            @user.save
            redirect_to @user
        else
            render :edit
        end
    end

    def show
        redirect_to new_user_path unless logged_in?
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :bio, :admin)
    end 
end
