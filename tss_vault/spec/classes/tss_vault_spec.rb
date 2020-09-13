# frozen_string_literal: true

require 'spec_helper'

describe 'tss_vault' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('/tmp/jptest4')
      end
    end
  end
end
