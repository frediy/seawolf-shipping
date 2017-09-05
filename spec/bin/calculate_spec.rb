require 'spec_helper'

RSpec.describe 'bin/calculate' do
  subject (:cli_call) { `./bin/calculate #{amount}` }

  describe 'problem examples' do
    describe 'example 1' do
      let(:amount) { 8 }

      it { is_expected.to eq "1P\n" }
    end

    describe 'example 2' do
      let(:amount) { 14 }

      it { is_expected.to eq "1P 1E\n" }
    end

    describe 'example 3' do
      let(:amount) { 12 }

      it { is_expected.to eq "2E\n" }
    end
  end

  describe 'integration tests' do
    describe 'very large amount' do
      let(:amount) { 1239 }

      it { is_expected.to eq "154P 1E 1S\n" }
    end

    describe 'very small amount' do
      let(:amount) { 1 }

      it { is_expected.to eq "1S\n" }
    end

    describe 'exactly one of each ship' do
      let(:amount) { 15 }

      it { is_expected.to eq "1P 1E 1S\n" }
    end

    describe 'amount is 0' do
      let(:amount) { 0 }

      it { is_expected.to eq "error: amount must be non-zero integer\n" }
    end

    describe 'amount is not an integer' do
      let(:amount) { 'not_an_integer' }

      it { is_expected.to eq "error: amount must be non-zero integer\n" }
    end
  end
end
