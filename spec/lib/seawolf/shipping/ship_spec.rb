require "spec_helper"

RSpec.describe Ship do
  subject(:ship) do
    described_class.new(identifier: identifier, name: name, capacity: capacity)
  end

  let(:identifier) { 'A' }
  let(:name) { 'Name' }
  let(:capacity) { 1 }

  describe '#identifier' do
    subject(:ship_identifier) { ship.identifier }

    let(:identifier) { 'A' }

    it { is_expected.to eq 'A' }
  end

  describe '#capacity' do
    subject(:ship_capacity) { ship.capacity }

    let(:capacity)   { 1 }

    it { is_expected.to eq 1 }
  end

  describe '#number_of_possible_trips' do
    subject(:number_of_possible_trips) { ship.number_of_possible_trips(amount) }

    context 'amount is smaller than capacity' do
      let(:amount) { 1 }
      let(:capacity) { 2 }

      it { is_expected.to eq 0 }
    end

    context 'amount is larger than capacity' do
      let(:amount) { 11 }
      let(:capacity) { 3 }

      it { is_expected.to eq 3 }
    end
  end

  describe '#unshippable_amount' do
    subject(:unshippable_amount) { ship.unshippable_amount(amount) }

    context 'amount is smaller than capacity' do
      let(:amount) { 3 }
      let(:capacity) { 11 }

      it { is_expected.to eq 3 }
    end

    context 'amount is larger than capacity' do
      let(:amount) { 11 }
      let(:capacity) { 3 }

      it { is_expected.to eq 2 }
    end
  end

  describe '#can_ship_amount?' do
    subject(:can_ship_amount?) { ship.can_ship_amount?(amount) }

    context 'amount is smaller than capacity' do
      let(:amount) { 1 }
      let(:capacity) { 2 }

      it { is_expected.to be false }
    end

    context 'amount is larger than capacity' do
      let(:amount) { 11 }
      let(:capacity) { 3 }

      it { is_expected.to be true }
    end
  end

  describe '#can_ship_entire_amount?' do
    subject(:can_ship_entire_amount?) { ship.can_ship_entire_amount?(amount) }

    context 'amount is divisible by capacity' do
      let(:amount) { 10 }
      let(:capacity) { 5 }

      it { is_expected.to eq true }
    end

    context 'amount is not divisible by capacity' do
      let(:amount) { 11 }
      let(:capacity) { 5 }

      it { is_expected.to eq false }
    end
  end
end
