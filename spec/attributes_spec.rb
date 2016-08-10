require 'spec_helper'

describe TinyRecord, "attributes" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  it "has all columns name of a table" do
    expect(Post.column_names).to eq ["id", "title", "content", "author", "comment_count"]
  end

  it "respond to column as method call" do
    post = Post.new
    expect(post.id).to be_nil
  end

  it "generate attributes related methods correctly" do
    post = Post.new
    expect(post).to respond_to :title
    expect(post).to respond_to :title=
    expect(post).to respond_to :content=
    expect(post).not_to respond_to :foo_bar
  end

  it "has default attribute values" do
    post = Post.new
    expect(post.id).to be_nil
    expect(post.title).to be_nil
    expect(post.content).to be_nil
    expect(post.author).to be_nil
  end

  it "can write and read attribute correctly" do
    post = Post.new
    post.title = "my_title"
    post.content = "my content"
    expect(post.title).to eq "my_title"
    expect(post.content).to eq "my content"
  end

  it "can transform attribute into correct type" do
    post = Post.new
    post.comment_count = "52"
    expect(post.comment_count).to eq 52
  end
end
