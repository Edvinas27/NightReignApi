require 'rails_helper'
RSpec.describe Weapons::Update do
  describe '#call' do
    context 'when record exists' do
      let(:weapon) { FactoryBot.create(:weapon) }
      context 'with valid parameters' do
        it 'updates the record' do
          new_weapon_type = FactoryBot.create(:weapon_type, name: "New")
          result = described_class.call(id: weapon.id, params: {
            weapon_type: new_weapon_type
          })
          weapon.reload
          expect(weapon.weapon_type.name).to eq("New")
          expect(result).to be_a_success
        end
      end
      context 'with invalid parameters' do
        let(:invalid_params) { { name: "", level_requirement: "invalid"} }
        it 'raises RecordInvalid' do
          expect {
            described_class.call(id: weapon.id, params: invalid_params)
          }.to raise_error(ActiveRecord::RecordInvalid)
        end
        it 'returns custom validation errors' do
          expect {
             described_class.call(id: weapon.id, params: invalid_params)
          }.to raise_error(ActiveRecord::RecordInvalid) { |error |
            expect_validation_errors(error.record.errors, {
              name: ["can't be blank"],
              level_requirement: ["is not a number"]
            })}
          expect(weapon).to eq(weapon.reload)
        end
      end
    end
    context 'when record does not exist' do
      it 'raises RecordNotFound' do
        expect {
          described_class.call(id: @test_id, params: {})
        }.to raise_error(ActiveRecord::RecordNotFound, "Weapon with id=#{@test_id} not found")
      end
    end
  end
end
