require 'puppet/type'

Puppet::Type.newtype(:rz_policy) do

  @doc = <<-EOT
    Manages razor policy.
  EOT

  ensurable

  newparam(:name) do
    desc 'unique name of policy'
  end

  newparam(:enabled) do
    desc 'enabled state for policy'
    newvalues(true, false, 'true', 'false')
    defaultto(true)
  end

  newparam(:repo) do
    desc 'name of repo to use'
  end

  newparam(:installer) do
    desc 'installer to use'
  end

  newparam(:broker) do
    desc 'name of broker'
  end

  newparam(:hostname) do
    desc 'hostname'
  end

  newparam(:root_password) do
    desc 'root password'
  end

  newparam(:bootproto) do
    desc 'management network boot protocol'
    newvalues(:dhcp, :static)
    defaultto(:dhcp)
  end

  newparam(:ip) do
    desc 'management network ip address (only for static bootproto)'
  end

  newparam(:gateway) do
    desc 'management network gateway (only for static bootproto)'
  end

  newparam(:netmask) do
    desc 'management network netmask (only for static bootproto)'
  end

  newparam(:max_count) do
    desc 'max count for policy'
    munge do |x|
      Integer(x)
    end
  end

  newparam(:rule_number) do
    munge do |x|
      Integer(x)
    end
  end

  newproperty(:tags, :array_matching => :all) do
  end

  autorequire(:rz_repo) do
    self[:repo]
  end

  autorequire(:rz_broker) do
    self[:broker]
  end

end
