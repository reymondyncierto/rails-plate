class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # If the user is saved successfully than respond with a success message
    if @user.save
      # session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      # If the user is not saved than show the registration form with an error message
      # flash.now[:alert] = "Couldn't create account"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # Permit the user to submit these parameters
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
