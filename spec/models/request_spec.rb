# coding: utf-8
require 'spec_helper'

describe Request do
  describe "#loves" do
    let(:myself) { FactoryGirl.create :user, uid: 2 }
    let(:user) { FactoryGirl.create :user, uid: 1 }
    context "自分を会いたい登録している人がいない場合" do
      it "loveは作られない" do
        expect {
          myself.requests.create(target_id: user.uid)
        }.not_to change { Love.count }
      end
    end
    context "自分を会いたい登録している人がいる場合" do
      before do
        user.requests.create(target_id: myself.uid)
      end
      it "loveが作られる" do
        expect {
          myself.requests.create(target_id: user.uid)
        }.to change { Love.count }.by(1)
      end
    end
    describe "#destroy" do
      let!(:request) { myself.requests.create(target_id: myself.uid) }
      context "loveがないとき" do
        it "loveの数は変わらない" do
          expect {
            request.destroy
          }.not_to change { Love.count }
        end
      end
      context "loveがあるとき" do
        before do
          request.create_love
        end
        it "loveがひとつ減る" do
          expect {
            request.destroy
          }.to change { Love.count }.by(-1)
        end
      end
    end
  end
end
