require 'spec_helper'

describe TinyRecord, "querying" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  before do
    Post.delete_all
  end

  it "can get record count of a table" do
    expect(Post.count).to eq 0
  end

  it "can create a record" do
    expect(Post.count).to eq 0
    Post.create(title: "Hello TinyRecord!")
    expect(Post.count).to eq 1
  end

  it "can delete all records" do
    Post.create(title: "Hello TinyRecord!")
    expect(Post.count).to eq 1
    Post.delete_all
    expect(Post.count).to eq 0
  end

  it "can save and destroy records" do
    Post.delete_all
    post = Post.new title: 'Hello TinyRecord!'
    post.save
    expect(Post.count).to eq 1
    Post.delete_all
    expect(Post.count).to eq 0
  end
end
