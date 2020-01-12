require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create!(name: 'Fretadão', url: 'https://twitter.com/usefretadao')
  end

  context "when user is valid" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end
end