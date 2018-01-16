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
  let(:subject) { "test_subject" }

  before(:example) {
    # @post = Xls::Post.new(file, url, subject)
    @post = double('Xls::Post')
  }

  it "test params correct" do
    # post = instance_double(Xls::Post)
    post = Xls::Post.new(file, url, subject)

    expect(post.file).to eq("file")
    expect(post.uri).to eq( post.gen_uri("url") )
    expect(post.subject).to eq("TestSubject")
  end

  it "test post" do
  end
end
