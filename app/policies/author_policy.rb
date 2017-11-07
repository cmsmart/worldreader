class AuthorPolicy < ApplicationPolicy
    
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
            return true if user.present? && ( user.admin? || user.publisher?)
        end

        def show?
            true
        end
        
        def create?
            return true if user.present? && ( user.admin? || user.publisher?)
        end
        
        def update?
            return true if user.present? && user.admin?
        end
        
        private
        
        def book
            record
        end
    
    end