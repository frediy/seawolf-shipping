require "spec_helper"

RSpec.describe Calculator do
  subject(:calculator) { described_class }

  describe '#schedule_from_transportation_amount' do
    subject(:schedule_from_transportation_amount) do
      calculator.schedule_from_transportation_amount(amount)
    end

    context 'returns single ship with one trip' do
      let(:amount) { 8 }

      specify { p schedule_from_transportation_amount }
    end

    context 'returns multiple ships with one trip' do
      let(:amount) { 14 }

      specify { p schedule_from_transportation_amount }
    end

    context 'returns single ship with multiple trips' do
      let(:amount) { 12 }

      specify { p schedule_from_transportation_amount }
    end

    context 'returns multiple ships with multiple trips' do
      let(:amount) { 20 }

      specify { p schedule_from_transportation_amount }
    end
  end
end
