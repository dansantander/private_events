class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    @user = User.find_by(id: params[:session][:private_event_user_id])

    if @user
      signin(@user.id)
      redirect_to user_path(@user.id)
    else
      flash.now[:message] = 'Incorrect'
      render 'new'
    end
  end

  def destroy
    logout

    redirect_to signin_path
  end
end

