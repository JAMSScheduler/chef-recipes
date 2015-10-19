remote_file "#{Chef::Config[:file_cache_path]}/JAMSAgentX-6.0.2-1.x86_64.rpm" do
	source "http://download.jamsscheduler.com/repo/redhat/x86_64/RPMS/JAMSAgentX-6.0.2-1.x86_64.rpm"
	action :create
end

rpm_package "JAMSAgentX" do
	source "#{Chef::Config[:file_cache_path]}/JAMSAgentX-6.0.2-1.x86_64.rpm"
    	action :install
end

file '/etc/yum.repos.d/JAMS.repo' do
content '[JAMS-$basearch]
name=JAMS Scheduler $basearch repository
baseurl=http://download.jamsscheduler.com/repo/redhat/$basearch
gpgcheck=1
enabled=1
gpgkey=http://download.jamsscheduler.com/repo/redhat/RPM-GPG-KEY-JAMS'
end