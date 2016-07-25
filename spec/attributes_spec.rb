require 'spec_helper'

describe TinyRecord, "attributes" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  it "has all columns name of a table" do
    names = Post.column_names
    expect(names).to eq ["id", "title", "content", "author"]
  end

  it "respond to column as method call" do
    post = Post.new
    expect(post.id).to be_nil
  end

  it "can also write attributes" do
    post = Post.new
    expect(post.title = "hello").to eq "hello"
  end
end
