class AddValueToSiteConfigurationOptions < ActiveRecord::Migration
  def change
    add_column :site_configuration_options, :value, :string
  end
end
