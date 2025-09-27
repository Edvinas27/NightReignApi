require 'rails_helper'
RSpec.describe Weapons::Show do
  describe '#call' do
    context 'when weapon exists' do
      it 'returns the weapon' do
      weapon = FactoryBot.create(:weapon)

      allow(Weapon).to receive(:find_by).with(id: weapon.id).and_return(weapon)

      result = Weapons::Show.call(id: weapon.id)

      expect(result).to be_a_success
      expect(result.weapon.name).to eq(weapon.name)
      end
    end
    context 'when weapon does not exist' do
      it 'throws RecordNotFound' do
        expect {
          Weapons::Show.call(id: 999)
        }.to raise_error(ActiveRecord::RecordNotFound, "Weapon with id=999 not found")
      end
    end
  end
end