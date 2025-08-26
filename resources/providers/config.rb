# Cookbook:: yara
# Provider:: config

include Yara::Helper

action :add do
  begin

    dnf_package 'yara' do
      action :upgrade
    end

    directory '/usr/share/logstash/yara_rules' do
      owner 'webui'
      group 'webui'
      mode '0755'
      action :create
    end

    # Uncomment when rb-sequence-oozie is merged
    # template '/var/rb-sequence-oozie/workflow/yara_loader.yml' do
    #   cookbook 'yara'
    #   source 'yara_loader.yml.erb'
    #   owner 'root'
    #   group 'root'
    #   mode '0644'
    #   retries 2
    #   # notifies :restart, 'service[rb-sequence-oozie]'
    # end
    
    # Uncomment when rb-sequence-oozie is merged
    # directory '/var/rb-sequence-oozie/workflow/lib/yara_rules' do
    #   owner 'root'
    #   group 'root'
    #   mode '0755'
    #   action :create
    # end

    # Uncomment when rb-sequence-oozie is merged
    yara_files = %w(APT_NGO_wuaclt.yara APT_NGO_wuaclt_PDF.yara GeorBotBinary.yara GeorBotMemory.yara 
      UserDB.yara avdetect.yara compiler.yara dbgdetect.yara epcompilersigs.yara eppackersigs.yara 
      malicious_document.yar malware.yar packer.yara packers.yara sandboxdetect.yara userdb_exeinfope.yara 
      userdb_jclausing.yara userdb_panda.yara vmdetect.yara)

    # yara_files.each do | yara_file |
    #   cookbook_file "/var/rb-sequence-oozie/workflow/lib/yara_rules/#{yara_file}" do
    #     source "#{yara_file}"
    #     owner 'root'
    #     group 'root'
    #     mode '0644'
    #     retries 2
    #     cookbook 'yara'
    #     ignore_failure true
    #     # notifies :restart, 'service[rb-sequence-oozie]'
    #   end
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
