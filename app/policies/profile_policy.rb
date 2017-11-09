class ProfilePolicy < ApplicationPolicy

        def index?
         false
        end
    

        def update?
            user && user == record.user
        end

        def my_book?
            scope.where(:id => record.id).exists?
        end

        def my_country?
            scope.where(:id => record.id).exists?
        end

end