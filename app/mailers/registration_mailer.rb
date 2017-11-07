class RegistrationMailer < ApplicationMailer

    def contact_registration(from_email, contact_name, publisher_name, website, details)
      @from_email = from_email
      @contact = contact_name
      @publisher = publisher_name
      @website = website
      @details = details

      registration_email = ENV.fetch('REGISTRATION_EMAIL')
      mail(to: registration_email, subject: "Registration request from #{@from_email}")
    end

end