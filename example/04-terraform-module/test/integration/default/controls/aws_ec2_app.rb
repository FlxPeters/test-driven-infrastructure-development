# Dynamic outputs from terraform as inputs in inspec
input('instance_id')
input('security_group_id')

control "aws_ec2_app" do
  # Ensure you have a Security Group with a specific name.
  describe aws_security_group(group_name: 'allow_http_8000') do
    it { should exist }
    it { should allow_in(port: 8000, ipv4_range: '0.0.0.0/0') }
  end

  describe aws_ec2_instance(input('instance_id')) do
    it { should exist }
    it { should be_running }
    its('security_groups') { should cmp([{:id=>input('security_group_id'), :name => "allow_http_8000"}]) }
  end
end