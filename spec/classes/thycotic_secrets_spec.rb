require 'spec_helper'

on_supported_os.each do |os, os_facts|
  describe 'thycotic_secrets::dsv' do
    context "for DSV on #{os}" do
   
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_secrets' }
      
      let(:params) { {
        client_id: ENV["CLIENT_ID"],
        client_secret: ENV["CLIENT_SECRET"],
        tenant: ENV["TENANT"],
        secret_path: ENV["SECRET_PATH"]
      } }

      it { is_expected.to compile }

    end
  end

  describe 'thycotic_secrets::tss' do
    context "for TSS on #{os}" do
   
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_secrets' }
      
      let(:params) { {
        username: ENV["USERNAME"],
        password: ENV["PASSWORD"],
        server_url: ENV["SERVER_URL"],
        secret_id: ENV["SECRET_ID"],
      } }

      it { is_expected.to compile }

    end
  end
end
