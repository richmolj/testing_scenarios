require 'spec_helper'

describe Post do

  let(:post) { Factory.build(:post) }

  describe "#can_be_destroyed?" do
    subject { post.can_be_destroyed? }

    context "when destroyable" do
      before do
        post.destroyable = true
      end

      context "when feature is turned off" do
        before do
          SiteConfigurationOption.stub(:[]).with('destroy_posts') { false }
        end

        it { should be_false }
      end

      context "when feature is turned on" do
        before do
          SiteConfigurationOption.stub(:[]).with('destroy_posts') { true }
        end

        it { should be_true }
      end
    end

    context "when not destroyable" do
      before do
        post.destroyable = false
      end

      it { should be_false }
    end
  end
end
