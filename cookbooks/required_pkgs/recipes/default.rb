package "linux-headers-$(uname -r)" do
  action :install
end

packages = %w(libxml2-dev libxslt-dev libmysqlclient-dev imagemagick libmagickwand-dev)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file "/tmp/wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz" do
  source "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.0/wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz"
  notifies :run, "bash[install_wkhtmltopdf]", :immediately
end

bash "install_wkhtmltopdf" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xvf wkhtmltox-linux-amd64_0.12.0-03c001d.tar.xz
    cp -v wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf
    chmod +x /usr/local/bin/wkhtmltopdf
  EOH
  action :nothing
end

