require 'spec_helper'

describe Spree::User do
  subject { create(:user) }

  before(:each) do
    subject.spree_roles << Spree::Role.where(name: 'customer_assistant').first
  end

  context 'methods' do
    describe '#first_available_assistant' do
      it 'returns any available assistant' do
        expect(Spree::User.first_available_assistant).to eq subject
      end
    end

    describe '#is_assistant?' do
      it 'returns true if user has assistant role' do
        expect(subject.is_assistant?).to be_true
      end
    end
  end

  context 'callbacks' do
    describe 'before_create' do
      it 'assigns random assistant' do
        expect(create(:user).assistant).to eq subject
      end
    end
  end
end
