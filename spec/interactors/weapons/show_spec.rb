require 'rails_helper'
RSpec.describe Weapons::Show do
  describe '#call' do
    context 'when record exists' do
      it 'returns the record' do
      weapon = FactoryBot.create(:weapon)
      result = described_class.call(id: weapon.id)
      expect(result).to be_a_success
      expect(result.weapon.name).to eq(weapon.name)
      end
    end
    context 'when record does not exist' do
      it 'raises RecordNotFound' do
        expect {
          described_class.call(id: @test_id)
        }.to raise_error(ActiveRecord::RecordNotFound, "Weapon with id=#{@test_id} not found")
      end
    end
  end
end