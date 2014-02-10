namespace :customer_assistants do
  desc "Assigns customer assistants to all users"
  task :assign_to_all_users => :environment do
    abort("Create some customer assistants before running this task") unless Spree::User.assistants.present?
    assistant_ids = Spree::User.assistants.pluck(:id)
    user_ids = Spree::User.where(assistant_id: nil).where.not(id: assistant_ids).pluck(:id)
    users_per_assistant = user_ids.size/assistant_ids.size
    i = 0
    user_ids.in_groups_of(users_per_assistant, false) do |group|
      Spree::User.where(id: group).update_all(assistant_id: assistant_ids[i])
      i+=1
    end
  end
end
