require 'spec_helper'

describe "Posts" do
  describe "DELETE to destroy" do
    context "when feature is turned off" do
      before do
        Factory(:site_configuration_option, :setting => 'destroy_posts', :value => false)
        @post = Factory(:post)
      end

      it "should not delete a post" do
        lambda {
          delete post_path(@post.to_param)
        }.should_not change { Post.count }
      end
    end

    context "when feature is turned on" do
      before do
        Factory(:site_configuration_option, :setting => 'destroy_posts', :value => true)
        @post = Factory(:post, :destroyable => true)
      end

      it "should delete the post" do
        lambda {
          delete post_path(@post.to_param)
        }.should change { Post.count }.by(-1)
      end
    end
  end
end
