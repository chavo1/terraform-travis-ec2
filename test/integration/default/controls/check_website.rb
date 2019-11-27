control 'check_website' do
  describe command('curl -sL http://localhost') do
    its('stdout') { should match (/Welcome */) }
  end

  describe command('curl -sL http://localhost') do
    its('stdout') { should_not match (/Sex */) }
  end

end
