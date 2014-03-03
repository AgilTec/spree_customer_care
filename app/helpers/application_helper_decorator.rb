require 'digest/md5'

ApplicationHelper.module_eval do
  def assistant_avatar_url(assistant)
    return assistant.assistant_avatar if assistant.assistant_avatar.present?
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(assistant.email)}"
  end
end
