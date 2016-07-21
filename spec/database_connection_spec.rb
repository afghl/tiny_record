require 'spec_helper'

describe TinyRecord, "database connection" do
  before do
    class Post < TinyRecord::Base; end
    class User < TinyRecord::Base; end
  end

  it "has connection" do
    expect(Post.connection).to be_a TinyRecord::ConnectionAdapters::Mysql2Adapter
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
