# # encoding: utf-8

# Inspec test for recipe odoo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('odoo') do
  it { should exist }
  its('group') { should eq 'odoo' }
end

describe file('/home/odoo/.cache/pip') do
  it { should be_directory }
  it { should be_owned_by 'odoo' }
  it { should be_grouped_into 'odoo' }
end

describe file('/opt/odoo') do
  it { should be_directory }
  it { should be_owned_by 'odoo' }
  it { should be_grouped_into 'odoo' }
end

describe file('/opt/odoo/requirements.txt') do
  it { should exist }
  its('content') { should include 'Jinja' }
end

describe command('python -V') do
  its('stderr') { should include 'Python 2.7.12' }
end

describe command('node -h')do
  its('stdout') { should include 'Usage: node' }
end

describe command('yarn -h') do
  its('stdout') { should include 'Usage: yarn' }
end

describe command('lessc -h') do
  its('stdout') { should include 'usage: lessc' }
end
