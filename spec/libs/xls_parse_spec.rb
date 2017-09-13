# coding: utf-8
require 'rails_helper'

RSpec.describe Xls::Parse do
  before(:example) do
    file_name = File.join(File.expand_path("../files", __FILE__), 'v9KUmP_小学英语会议报名_20170817162821.xls')
    @parse = Xls::Parse.new(file: file_name)
    @rows_count = @parse.sheet.last_row - 2
  end
  
  it "load file success, class == Roo::Excel" do

    expect(@parse.load).to be_an_instance_of(Roo::Excel)
  end

  it "have sheets" do
    sheets = @parse.sheet.sheets 
    expect(sheets).to include('Sheet1')
  end

  it "test row 1 first column is order" do
    expect(@parse.row1.first).to eq("序号")
  end

  it "row1_dup_nil without nil" do
    expect( @parse.row1_dup_nil(@parse.row1).any? {|item| item.nil?} ).to be_falsy
  end

  it "row2_values array count" do
    @rows_count = @parse.sheet.last_row - 2
    expect( @parse.row2_values.count ).to eq(@rows_count)
  end

  it "to_hash result each one is a hash" do
    to_hash = @parse.to_hash
    # test each item is hash    
    to_hash.each do |hash|
      expect( hash.is_a?(Hash) ).to be true
    end
    # test count
    expect( to_hash.count ).to eq(@rows_count)
  end

end


