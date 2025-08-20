Name: cookbook-yara
Version: %{__version}
Release: %{__release}%{?dist}
BuildArch: noarch
Summary: cookbook to install and configure yara in the redborder platform.

License: AGPL 3.0
URL: https://github.com/redBorder/cookbook-yara
Source0: %{name}-%{version}.tar.gz

%description
%{summary}

%prep
%setup -qn %{name}-%{version}

%build

%install
mkdir -p %{buildroot}/var/chef/cookbooks/yara
cp -f -r  resources/* %{buildroot}/var/chef/cookbooks/yara
chmod -R 0755 %{buildroot}/var/chef/cookbooks/yara
install -D -m 0644 README.md %{buildroot}/var/chef/cookbooks/yara/README.md

%pre
if [ -d /var/chef/cookbooks/yara ]; then
    rm -rf /var/chef/cookbooks/yara
fi

%post
case "$1" in
  1)
    # This is an initial install.
    :
  ;;
  2)
    # This is an upgrade.
    su - -s /bin/bash -c 'source /etc/profile && rvm gemset use default && env knife cookbook upload yara'
  ;;
esac

%postun
# Deletes directory when uninstalling the package
if [ "$1" = 0 ] && [ -d /var/chef/cookbooks/yara ]; then
  rm -rf /var/chef/cookbooks/yara
fi

%files
%defattr(0644,root,root)
%attr(0755,root,root)
/var/chef/cookbooks/yara
%defattr(0644,root,root)
/var/chef/cookbooks/yara/README.md

%doc

%changelog
* Thu Aug 14 2025 Pablo Torres <ptorres@redborder.com>
- Create yara cookbook
