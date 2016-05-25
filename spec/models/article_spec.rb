require 'rails_helper'

describe Article do
  let(:article) {FactoryGirl.build(:article)}

  it 'has name' do
    expect(article).to respond_to(:name)
  end
end
