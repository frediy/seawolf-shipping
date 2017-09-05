require "spec_helper"

RSpec.describe ShipsReport do
  subject(:ships_report) { ShipsReport.new(ships) }

  describe '#to_s' do
    subject(:to_s) { ships_report.to_s }

    context 'one ship type' do
      let(:ships) do
        [
          Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
          Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1)
        ]
      end

      it { is_expected.to eq '2S' }
    end

    context 'multiple ship types' do
      let(:ships) do
        [
          Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
          Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
          Ship.new(identifier: 'S', name: 'Speedy',  capacity: 1),
          Ship.new(identifier: 'E', name: 'El Gamo', capacity: 6),
          Ship.new(identifier: 'E', name: 'El Gamo', capacity: 6),
          Ship.new(identifier: 'P', name: 'Preuben', capacity: 8)
        ]
      end

      it { is_expected.to eq '3S 2E 1P' }
    end
  end
end
