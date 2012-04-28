require 'spec_helper'

describe User do
  describe "#create" do
    subject { FactoryGirl.create :user }
    it { should be_persisted }
  end
end
