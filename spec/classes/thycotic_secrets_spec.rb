require 'spec_helper'

on_supported_os.each do |os, os_facts|
  describe 'thycotic_dsv::dsv' do
    context "for DSV on #{os}" do
   
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_dsv' }
      
      let(:params) { {
        client_id: ENV["CLIENT_ID"],
        client_secret: ENV["CLIENT_SECRET"],
        tenant: ENV["TENANT"],
        secret_path: ENV["SECRET_PATH"]
      } }

      it { is_expected.to compile }

    end
  end
end
