require 'spec_helper'

describe TinyRecord do
  before do
    class Post < TinyRecord::Base; end
  end

  it 'has a version number' do
    expect(TinyRecord::VERSION).not_to be nil
  end

  it 'can be inherited' do
    expect(Post.ancestors).to include TinyRecord::Base
  end
end
