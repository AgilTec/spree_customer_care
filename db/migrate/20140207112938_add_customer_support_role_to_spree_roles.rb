class AddCustomerSupportRoleToSpreeRoles < ActiveRecord::Migration
  def change
    Spree::Role.create(name: 'customer_assistant')
  end
end
