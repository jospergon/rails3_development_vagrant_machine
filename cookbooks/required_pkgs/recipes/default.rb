package "linux-headers-$(uname -r)" do
  action :install
end

packages = %w(gzip tar libxml2-dev libxslt-dev libmysqlclient-dev imagemagick libmagickwand-dev wkhtmltopdf)

packages.each do |pkg|
  package pkg do
    options "-f"
    action :install
  end
end
