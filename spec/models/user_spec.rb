require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:password_confirmation) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { should have_many(:orders) }
end
