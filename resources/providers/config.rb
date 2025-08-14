# Cookbook:: yara
# Provider:: config

include Yara::Helper

action :add do
  begin

    dnf_package 'yara' do
      action :upgrade
    end

    # directory '/var/log/aerospike' do
    #   owner user
    #   group user
    #   mode '0755'
    # end

    # file '/var/log/aerospike/aerospike.log' do
    #   owner user
    #   group user
    #   mode '0644'
    #   action :create_if_missing
    # end

    # template '/etc/aerospike/aerospike.conf' do
    #   cookbook 'aerospike'
    #   source 'aerospike.conf.erb'
    #   owner user
    #   group user
    #   mode '0644'
    #   retries 2
    #   notifies :restart, 'service[aerospike]'
    #   variables(
    #     ipsync: ipaddress_sync,
    #     managers_ips: get_manager_ips(managers_per_service)
    #   )
    # end

    # template '/var/rb-sequence-oozie/conf/aerospike.yml' do
    #   cookbook 'aerospike'
    #   source 'rb-sequence-oozie_aerospike.yml.erb'
    #   owner user
    #   group user
    #   mode '0644'
    #   retries 2
    #   notifies :restart, 'service[rb-sequence-oozie]'
    #   variables(
    #     managers: managers_per_service['aerospike']
    #   )
    # end

    # service 'aerospike' do
    #   action [:enable, :start]
    # end

    Chef::Log.info('Yara cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end

action :remove do
  begin
    # service 'aerospike' do
    #   service_name 'aerospike'
    #   ignore_failure true
    #   supports status: true, enable: true
    #   action [:stop, :disable]
    # end

    dnf_package 'yara' do
      action :remove
    end


    Chef::Log.info('Yara cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end
