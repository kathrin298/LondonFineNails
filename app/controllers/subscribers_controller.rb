class SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.new(subscriber_params)
    authorize subscriber
    if subscriber.save
      flash[:success] = "You have subscribed successfully"
    else
      flash[:error] = "Problem in subscription: #{subscriber.errors.full_messages.join(', ')}"
    end
    redirect_to request.referrer
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

end
