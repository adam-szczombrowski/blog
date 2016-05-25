require 'rails_helper'

describe Project do
  let(:project) {build(:project)}

  it 'has name' do
    expect(project).to respond_to(:name)
  end

  it 'has description' do
    expect(project).to respond_to(:description)
  end

  it 'has link' do
    expect(project).to respond_to(:link)
  end

  it 'is invalid without name' do
    project.name = nil
    expect {project.save}.not_to change {Project.count}
  end

  it 'is invalid without description' do
    project.description = nil
    expect {project.save}.not_to change {Project.count}
  end

  it 'is invalid without link' do
    project.link = nil
    expect {project.save}.not_to change {Project.count}
  end

  it 'has unique name' do
    proj = create(:project)
    project.name = proj.name
    expect {project.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
