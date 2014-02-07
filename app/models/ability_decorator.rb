class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('customer_assistant')
      # support abilities
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)
