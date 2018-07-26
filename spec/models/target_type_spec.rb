require 'rails_helper'

describe TargetType, type: :model do
  describe '#icon_name' do
    before do
      Constants::TARGET_TYPES.each do |name|
        create(:target_type, name: name)
      end
    end

    it 'returns a fontawesome icon name related to its name' do
      terrestrial = TargetType.find_by(name: 'Terrestrial Ecosystem')
      expect(terrestrial.icon_name).to eq 'globe-africa'
    end

    it 'returns question when it does not have a name' do
      no_name = create(:target_type, name: nil)
      expect(no_name.icon_name).to eq 'question'
    end
  end
end
