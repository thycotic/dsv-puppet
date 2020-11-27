# frozen_string_literal: true

require 'spec_helper'


on_supported_os.each do |os, os_facts|
  describe 'thycotic_secrets::dsv' do
    context "for DSV on #{os}" do
   
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_secrets' }
      
      let(:params) { { 
        client_id: 'aff24976-7832-40d7-8e3e-df893f38e18a',
        client_secret: 'unVqEpfuk315qNiXAKI-s1mHCA0qcHcDY4py8Y9ZvC4',
        tenant: 'tmg',
        secret_path: '/test/sdk/nested'
      } }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/tmp/test-secret.txt').with_content(%r{password})
      end

    end
  end

  describe 'thycotic_secrets::tss' do
    context "for TSS on #{os}" do
   
      let(:facts) { os_facts }
      let(:pre_condition) { 'include thycotic_secrets' }
      
      let(:params) { { 
        username: 'sdk_test_app',
        password: 'm3x8r6tA2nQR',
        tenant: 'tmg',
        secret_id: '1',
      } }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/tmp/test-secret.txt').with_content(%r{password})
      end
    end
  end
  
end
