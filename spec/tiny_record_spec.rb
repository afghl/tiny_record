require 'spec_helper'

describe TinyRecord do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
  end

  it 'has a version number' do
    expect(TinyRecord::VERSION).not_to be nil
  end

  it 'can be inherited' do
    expect(Post).to inherit_from TinyRecord::Base
  end

  it "can get proper instance" do
    expect do
      Post.new(title: "Hello TinyRecord!", foo: "bar")
    end.not_to raise_error
  end
end
