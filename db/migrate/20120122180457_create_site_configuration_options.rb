class CreateSiteConfigurationOptions < ActiveRecord::Migration
  def change
    create_table :site_configuration_options do |t|
      t.string :setting
      t.timestamps
    end
  end
end
