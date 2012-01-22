class Post < ActiveRecord::Base

  def can_be_destroyed?
    destroyable? && SiteConfigurationOption['destroy_posts'] == true
  end

end
