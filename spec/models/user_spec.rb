require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    # User.new(name: 'Nick', email: 'nick@yahoo.com', password: '123456')
    User.new(name: 'Nick')
  end
  before { subject.save }

  it 'should valid the name' do
    subject.name = 'Michael'
    expect(subject).to be_valid
  end
end
