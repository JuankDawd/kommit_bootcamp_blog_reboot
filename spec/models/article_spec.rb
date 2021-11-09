require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'association' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to belong_to(:user) }
  end
end
