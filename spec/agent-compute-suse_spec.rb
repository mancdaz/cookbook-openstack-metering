# encoding: UTF-8
require_relative 'spec_helper'

describe 'openstack-telemetry::agent-compute' do
  before { telemetry_stubs }
  describe 'suse' do
    before do
      @chef_run = ::ChefSpec::Runner.new ::SUSE_OPTS
      @chef_run.converge 'openstack-telemetry::agent-compute'
    end

    it 'installs the agent-compute package' do
      expect(@chef_run).to install_package 'openstack-ceilometer-agent-compute'
    end

    it 'starts the agent-compute service' do
      expect(@chef_run).to start_service 'openstack-ceilometer-agent-compute'
    end
  end
end
