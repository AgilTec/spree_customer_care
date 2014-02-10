require 'digest/md5'

ApplicationHelper.module_eval do
  def assistant_avatar_url(assistant)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(assistant.email)}"
  end
end
