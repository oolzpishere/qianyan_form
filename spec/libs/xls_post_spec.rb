# coding: utf-8
require 'rails_helper'

RSpec.describe Xls::Post do
  # before(:example) do
  #   file_name = File.join(File.expand_path("../files", __FILE__), 'v9KUmP_小学英语会议报名_20170817162821.xls')
  #   @parse = Xls::Parse.new(file: file_name)
  #   @rows_count = @parse.sheet.last_row - 2
  # end
  let(:file) { "file" }
  let(:url) {"url"}
  let(:subject) { "subject" }

  before(:example) {
    @post = Xls::Post.new(file, url, subject)
  }

  it "test params correct" do
    # post = instance_double(Xls::Post)
    expect(@post.file).to eq("file")
    expect(@post.url).to eq("url")
    expect(@post.subject).to eq("Subject")
  end

  it "test post" do
    expect(@post).to receive(:post).with(0..-1)
    @post.post(0..-1)
  end
end
