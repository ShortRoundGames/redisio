#
# Cookbook Name:: redisio
# Recipe:: enable
#
# Copyright 2013, Brian Bianco <brian.bianco@gmail.com>
#
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
#

redis = node['redisio']

instance_name = node[:opsworks][:instance][:hostname]

if (redis[:job_control] == 'monit')
    # Reload monit
    bash "reload monit" do
        user "root"
        cwd "/tmp"
        code <<-EOS
            monit reload
        EOS
    end
else
    redis['servers'].each do |current_server|
        if (!current_server["instance"] || current_server["instance"] == instance_name)
            server_name = current_server["name"] || current_server["port"]
            resource = resources("service[redis_#{server_name}]")
            resource.action Array(resource.action)
            resource.action << :start
            resource.action << :enable
        end
    end
end




