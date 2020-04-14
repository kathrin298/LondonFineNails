class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
      @contact = Contact.new(params[:contact])
      authorize @contact
      @contact.request = request
      respond_to do |format|
        if @contact.deliver
          # re-initialize Contact object for cleared form
          @contact = Contact.new
          authorize @contact
          format.html { render '../pages/contact'}
          format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
        else
          format.html { render '../pages/contact' }
          format.js   { flash.now[:error] = @message = "Message did not send." }
        end
      end
    end
end
