require 'spec_helper'

class DummyUserClass
  include AssistantAvatarSupport

  def dummy_avatar
    'it works!'
  end
end

describe DummyUserClass do
  subject { described_class.new }

  describe '#assistant_avatar'
  it 'returns nil if theres no method specified' do
    expect(subject.assistant_avatar).to be_nil
  end

  it 'allows specifying assistant_avatar method' do
    DummyUserClass.class_eval do
      set_assistant_avatar :dummy_avatar
    end
    expect(subject).to receive(:dummy_avatar).once
    subject.assistant_avatar
  end
end
