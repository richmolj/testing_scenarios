require 'spec_helper'

describe "Posts" do
  def create_post(opts)
    feature_setting = opts[:feature] == :off ? 'false' : 'true'
    Factory(:site_configuration_option, :setting => 'destroy_posts', :value => feature_setting)
    @post = Factory(:post, :destroyable => true)
  end

  # BASIC RSPEC
  describe "DELETE to destroy" do
    context "when feature is turned off" do
      before do
        create_post(:feature => :off)
      end

      it "should not delete a post" do
        lambda {
          delete post_path(@post.to_param)
        }.should_not change { Post.count }
      end
    end

    context "when feature is turned on" do
      before do
        create_post(:feature => :on)
      end

      it "should delete the post" do
        lambda {
          delete post_path(@post.to_param)
        }.should change { Post.count }.by(-1)
      end
    end
  end

  # CAPYBARA
  describe "DELETE to destroy with capybara", :type => :request do
    context "when the feature is turned off" do
      before do
        create_post(:feature => :off)
      end

      it "should not delete the post" do
        visit(posts_path)
        lambda { click_link('Destroy') }.should_not change { Post.count }
      end
    end

    context "when the feature is turned on" do
      before do
        create_post(:feature => :on)
      end

      it "should not delete the post" do
        visit(posts_path)
        lambda { click_link('Destroy') }.should change { Post.count }.by(-1)
      end
    end
  end
end
