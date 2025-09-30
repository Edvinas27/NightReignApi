require 'rails_helper'

RSpec.describe Weapons::Destroy do
  describe '#call' do
    context 'when record exists' do
      it 'deletes the record' do
        weapon = FactoryBot.create(:weapon)
        result = described_class.call(id: weapon.id)
        expect(result).to be_a_success
        expect(Weapon.find_by(id: weapon.id)).to be_nil
      end
    end
    context 'when record does not exist' do
      it 'does not raise an exception and does nothing' do
        expect {
          result = described_class.call(id: @test_id)
          expect(result).to be_a_success
        }.to_not raise_error
      end
    end
  end
end
