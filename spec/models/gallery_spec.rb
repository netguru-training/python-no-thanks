require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it { should validate_presence_of user  }
  it { should validate_presence_of title }
  it { should validate_presence_of title }
  it { should validate_presence_of description }
  it { should validate_presence_of images }
end
