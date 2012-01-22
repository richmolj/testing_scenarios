class SiteConfigurationOption < ActiveRecord::Base

  def self.[](val)
    find_by_setting(val).value
  end

end
