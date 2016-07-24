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
    new_post = Post.new(title: "Hello TinyRecord!")
    expect(new_post.attributes[:title]).to eq "Hello TinyRecord!"
  end
end
