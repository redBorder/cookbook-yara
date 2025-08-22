# Cookbook:: yara
# Provider:: config

include Yara::Helper

action :add do
  begin

    dnf_package 'yara' do
      action :upgrade
    end

    directory "/usr/share/logstash/yara_rules" do
      owner "webui"
      group "webui"
      mode 0755
      action :create
    end

    # Uncomment when rb-sequence-oozie is merged
    # template '/var/rb-sequence-oozie/workflow/yara_loader.yml' do
    #   cookbook 'yara'
    #   source 'yara_loader.yml.erb'
    #   owner root
    #   group root
    #   mode '0644'
    #   retries 2
    #   notifies :restart, 'service[rb-sequence-oozie]'
    # end


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
