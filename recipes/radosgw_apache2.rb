#
# Author:: Kyle Bader <kyle.bader@dreamhost.com>
# Cookbook Name:: ceph
# Recipe:: radosgw_apache2
#
# Copyright 2011, DreamHost Web Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "apache2"
include_recipe "apache2::mod_fastcgi"

apache_module "rewrite" do
  conf false
end

web_app "rgw" do
  template "rgw.conf.erb"
  server_name node['ceph']['radosgw']['api_fqdn']
  admin_email node['ceph']['radosgw']['admin_email']
  ceph_rgw_addr node['ceph']['radosgw']['rgw_addr']
end
