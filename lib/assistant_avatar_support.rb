module AssistantAvatarSupport
  extend ActiveSupport::Concern

  module ClassMethods
    def set_assistant_avatar(method)
      class_variable_set(:@@assistant_avatar_method, method)
    end
  end

  def assistant_avatar
    return nil unless self.class.class_variable_defined?(:@@assistant_avatar_method)
    self.send(self.class.class_variable_get(:@@assistant_avatar_method))
  end
end
