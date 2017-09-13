# coding: utf-8
require 'rails_helper'

RSpec.describe Rule do
  # before(:example) do
  #   file_name = File.join(File.expand_path("../files", __FILE__), 'v9KUmP_小学英语会议报名_20170817162821.xls')
  #   @parse = Xls::Parse.new(file: file_name)
  #   @rows_count = @parse.sheet.last_row - 2
  # end
  before(:example) do
    @rule = Rule.new
  end

  it "province not duplication" do
    expect(@rule.province_dup?).to be false
  end
  
  it "expect have 33 provinces" do
    expect(@rule.select_provinces_array.count).to eq(33)
    # expect(@parse.load).to be_an_instance_of(Roo::Excel)
  end

  it "#to do add filter not Guangxi province" do
    @rule.content_array.each_with_index do |item, index|
      if item.match(/中选择了\ “(\p{Word}+)”/) && !$1.match(/广西/)
        expect(@rule.content_array[index+2]).to match(/广西区外报名/)
      end
    end
  end
end
