require 'rails_helper'
RSpec.describe Weapons::Create do
  describe '#call' do
    context 'with valid parameters' do
      it 'creates a new weapon' do
        weapon_type = FactoryBot.create(:weapon_type)
        quality = FactoryBot.create(:quality)
        params = {
          name: "Wylder's Greatsword",
          weapon_type_id: weapon_type.id,
          level_requirement: 10,
          quality_id: quality.id,
          stats: DefaultWeaponStats::DEFAULT_TEST_WEAPON_STAT_VALUES
        }
        result = described_class.call(params: params)

        expect(result).to be_a_success
        expect(result.weapon).to be_persisted
        expect(result.weapon.name).to eq("Wylder's Greatsword")
      end
    end
    context 'with invalid parameters' do
      let(:invalid_params) { { name: "" } }
      it 'fails to create a weapon and raises RecordInvalid' do
        expect {
          described_class.call(params: invalid_params)
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
      it 'returns custom validation errors' do
        expect {
          described_class.call(params: invalid_params)
        }.to raise_error(ActiveRecord::RecordInvalid) { |error|
          expect_validation_errors(error.record.errors, {
            name: ["can't be blank"],
            weapon_type: ["must exist"],
            quality: ["must exist"],
            level_requirement: ["can't be blank", "is not a number"],
            stats: [
              "-> missing attack stats: Phy, Mag, Fire, Ligt, Holy, Crit",
              "-> missing guard stats: Phy, Mag, Fire, Ligt, Holy, Boost",
              "-> scaling must be present"
            ]
          })}
        end
      end
    end
end