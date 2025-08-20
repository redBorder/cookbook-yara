# Cookbook:: yara
# Provider:: config

include Yara::Helper

action :add do
  begin

    dnf_package 'yara' do
      action :upgrade
    end

    Chef::Log.info('Yara cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end

action :remove do
  begin

    dnf_package 'yara' do
      action :remove
    end


    Chef::Log.info('Yara cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end
