# frozen_string_literal: true

#
# Cookbook:: container_opensmtpd
# Recipe:: repositories
#
# Copyright:: 2020, Morton Jonuschat <m.jonuschat@mojocode.de>
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'gpg-agent' do
  action :upgrade
end

## PostgreSQL Global Development Group (PGDG) repository
apt_repository 'pgdg' do
  uri 'http://apt.postgresql.org/pub/repos/apt/'
  key '7FCC7D46ACCC4CF8'
  distribution "#{node['lsb']['codename']}-pgdg"
  components %w[main]
end

## Update apt repository information
apt_update 'refresh' do
  action :update
end
