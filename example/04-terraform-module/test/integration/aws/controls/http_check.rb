require 'rspec/retry'

input('instance_public_ip')

RSpec.configure do |config|
  # show retry status in spec process
  config.verbose_retry = true
  # show exception that triggers a retry if verbose_retry is set to true
  config.display_try_failure_messages = true
end

control "http_check" do
  
  # Will fail due to timing issues
  # describe http('http://' + input('instance_public_ip') + ':8000') do
  #   its('status') { should cmp 200 }
  # end

  # Use rspec style and rspec extensions
  # https://www.sidorenko.io/post/2016/11/writing-inspec-tests-in-the-rspec-style/
  describe 'Port 8080 serves app' do
    it 'should be listening', retry: 60, retry_wait: 1 do
      expect(http('http://' + input('instance_public_ip') + ':8000').status).to eq 200
    end
  end


end