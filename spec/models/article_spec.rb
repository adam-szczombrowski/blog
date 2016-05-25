require 'rails_helper'

describe Article do
  let(:article) {FactoryGirl.build(:article)}

  it 'has name' do
    expect(article).to respond_to(:name)
  end

  it 'has content' do
    expect(article).to respond_to(:content)
  end
  it 'is invalid without name' do
    article.name = nil
    expect {article.save}.not_to change {Article.count}
  end
  it 'is invalid without content' do
    article.content = nil
    expect {article.save}.not_to change {Article.count}
  end

  it 'has unique name' do
    FactoryGirl.create(:article)
    expect {article.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
