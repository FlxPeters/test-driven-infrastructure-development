title 'Ensure Demo app is set up correctly'

describe service('docker') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
end

describe port(8000) do
    it { should be_listening }
end

describe http('http://localhost:8000') do
  its('status') { should cmp 200 }
end