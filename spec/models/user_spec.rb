# coding: utf-8
require 'spec_helper'

describe User do
  describe "#valid?" do
    context "必要な値が与えられているとき" do
      subject { FactoryGirl.build :user }
      it { should be_valid }
    end
    context "tokenがないとき" do
      subject { FactoryGirl.build :user, token: nil }
      it { should_not be_valid }
    end
    context "uidがないとき" do
      subject { FactoryGirl.build :user, uid: nil }
      it { should_not be_valid }
    end
  end
  describe ".find_or_create_by_auth_hash" do
    let(:auth_hash) {
      {
        'uid' => 'user_uid',
        'info' => {
          'name' => 'user_name',
          'nickname' => 'user_nickname',
          'image' => 'http://example.com/sample.jpg'
        },
        'credentials' => {
          'token' => 'access_token'
        }
      }
    }
    describe "戻り値" do
      subject { User.find_or_create_by_auth_hash(auth_hash) }
      it { should be_kind_of(User) }
      its(:uid) { should == auth_hash['uid'] }
      its(:name) { should == auth_hash['info']['name'] }
      its(:nickname) { should == auth_hash['info']['nickname'] }
      its(:image) { should == auth_hash['info']['image'] }
      its(:token) { should == auth_hash['credentials']['token'] }
    end
    describe "User.count" do
      subject { User.count }
      context "初めてログインした場合" do
        before do
          User.find_or_create_by_auth_hash(auth_hash)
        end
        it { should == 1 }
      end
      context "ログインは初めてではない場合" do
        before do
          2.times { User.find_or_create_by_auth_hash(auth_hash) }
        end
        it { should == 1 }
      end
    end
  end
end
