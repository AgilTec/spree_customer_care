module Spree
  User.class_eval do
    has_many :assisted_customers, class_name: 'Spree::User', foreign_key: 'assistant_id'
    belongs_to :assistant, class_name: 'Spree::User'

    scope :assistants, ->{ includes(:spree_roles).where("#{Role.table_name}.name" => "customer_assistant") }

    before_create :assign_assistant

    def self.first_available_assistant
      assisted_users_counts = User.assistants.includes(:assisted_customers).group("spree_users.id").count("assisted_customers_spree_users.id")
      user_ids = assisted_users_counts.select{ |k,v| v == assisted_users_counts.values.min }
      User.find(user_ids.keys.sample)
    end

    def is_assistant?
      self.spree_roles.where(name: "customer_assistant").present?
    end

    private
    def assign_assistant
      return true if !User.assistants.present? || self.is_assistant?
      self.assistant_id = User.first_available_assistant.id
    end
  end
end
