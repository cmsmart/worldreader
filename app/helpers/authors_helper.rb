module AuthorsHelper

    def format_date_of_birth(dob)
            dob.to_date.strftime('%e %b %Y')
    end
end
