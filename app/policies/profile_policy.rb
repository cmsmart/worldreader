class ProfilePolicy < ApplicationPolicy
    
        class Scope
            attr_reader :user, :scope
        
            def initialize(user, scope)
               @user = user
               @scope = scope
            end
        
            def resolve
                if user.present? && user.admin?
                    scope.all
                else
                    scope.none
              end
            end
        end
    
        def index?
            return true if user.present? && user.admin?
        end

end