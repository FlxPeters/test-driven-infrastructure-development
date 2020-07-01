# Ensure you have a Security Group with a specific name.
describe aws_security_group(group_name: 'public-http') do
  it { should exist }
end

describe aws_elbs do
  its('load_balancer_names') { should include 'elb-name' }
end