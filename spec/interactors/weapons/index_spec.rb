require 'rails_helper'
RSpec.describe Weapons::Index do
  describe '#call' do
    context 'when there are records' do
      it 'returns all records' do
        weapon1 = FactoryBot.create(:weapon)
        weapon2 = FactoryBot.create(:weapon)
        result = described_class.call
        expect(result).to be_a_success
        expect(result.weapons).to eq([weapon1, weapon2])
      end
    end
    context 'when there are no records' do
      it 'returns an empty array' do
        result = described_class.call
        expect(result).to be_a_success
        expect(result.weapons).to eq([])
      end
    end
  end
end