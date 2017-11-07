class RegistrationController < ApplicationController
    def new
      @error_messages = []
    end
  
    def create
      from_email = params[:email]
      contact = params[:contact_name]
      publisher = params[:publisher_name]
      website = params[:website]
      details = params[:details]
  
      @error_messages = []
      @error_messages << 'Please enter your email' if from_email.blank?
      @error_messages << 'Please enter your contact name' if contact.blank?
      @error_messages << 'Please enter your company name' if publisher.blank?
      @error_messages << 'Please enter your message' if details.blank?
  
      # No errors, all good
      if @error_messages.empty?
        # Send the message to our support email address
        RegistrationMailer.contact_registration(from_email, contact, publisher, website, details).deliver_now
        # Show success message
        render :success
      # There are errors
      else
        # Show the user the errors
        render :new
      end
    end
  end 