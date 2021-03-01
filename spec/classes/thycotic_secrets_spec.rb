require 'spec_helper'

on_supported_os.each do |os, os_facts|
  describe 'dsv' do
    context "for DSV on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          client_id: ENV['CLIENT_ID'],
          client_secret: ENV['CLIENT_SECRET'],
          tenant: ENV['TENANT'],
          secret_path: ENV['SECRET_PATH'],
        }
      end

      it { is_expected.to compile }
    end
  end
end
