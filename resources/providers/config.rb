# Cookbook:: yara
# Provider:: config

include Yara::Helper

action :add do
  begin
    dnf_package 'yara' do
      action :upgrade
    end

    template '/var/www/rb-rails/config/yara_loader.yml' do
      cookbook 'yara'
      source 'yara_loader.yml.erb'
      owner 'root'
      group 'root'
      mode '0644'
      retries 2
      # notifies :restart, 'service[rb-sequence-oozie]'
    end

    # Copy all YARA rules from the cookbook to the node
    remote_directory '/tmp/yara_rules_src' do
      source 'yara'
      files_owner 'root'
      files_group 'root'
      files_mode '0644'
      cookbook 'yara'
      purge true
      action :create
      sensitive true
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
