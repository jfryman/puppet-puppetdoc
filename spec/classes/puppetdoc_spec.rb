require 'spec_helper.rb'

describe 'puppetdoc' do

  let(:params) {{
    :puppetmaster => 'localhost'
  }}
  let(:facts) {{
    :operatingsystemrelease => '6.6',
    :osfamily => 'RedHat',
    :concat_basedir => '/dne'
  }}
  let(:pre_condition) {[
      'include apache'
  ]}
  it { should compile }
  it { should contain_class('puppetdoc') }

end
