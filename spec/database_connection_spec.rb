require 'spec_helper'

describe TinyRecord, "database connection" do
  before(:all) do
    Post ||= Class.new(TinyRecord::Base)
    User ||= Class.new(TinyRecord::Base)
  end

  it "can execute sql statement directly" do
    expect do
      Post.connection.execute("SELECT * FROM posts;")
    end.not_to raise_error
  end

  it "can get columns information" do
    expect(Post.connection.columns(Post.table_name)).to be_a Array
  end

end
