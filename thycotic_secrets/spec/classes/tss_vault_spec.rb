# frozen_string_literal: true

require 'spec_helper'

describe 'thycotic_secret' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      let(:params) { { mode: 'dsv' } }
      it do
        is_expected.to contain_file('/tmp/test-secret.txt').with_content(%r{password})
      end

      let(:params) { { mode: 'tss' } }
      it do
        is_expected.to contain_file('/tmp/test-secret.txt').with_content(%r{password})
      end
    end
  end
end
