class ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
        return true if user.present? && user.admin?
    end
  
    def show?
        return true if user.present? && user.admin?
    end
  
    def create?
        return true if user.present? && user.admin?
    end
  
    def new?
        return true if user.present? && user.admin?
    end
  
    def update?
        return true if user.present? && user.admin?
    end
  
    def edit?
      return true if user.present? && user.admin?
    end
  
    def destroy?
      user.admin?
    end
  
    def scope
      Pundit.policy_scope!(user, record.class)
    end
  
    class Scope
      attr_reader :user, :scope
  
      def initialize(user, scope)
        @user = user
        @scope = scope
      end
  
      def resolve
        scope
      end
    end
  end
  