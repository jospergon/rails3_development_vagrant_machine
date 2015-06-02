 bash "install_ruby_source" do
   user "root"
   group "rvm"
   code <<-EOH
     rvm reinstall 1.9.3 --disable-binary
   EOH
end
