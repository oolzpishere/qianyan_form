# coding: utf-8
class Rule
  attr_reader :content_array
  
  def initialize
    file_name = File.join(File.expand_path("../files", __FILE__), 'rules')
    file = File.new(file_name)
    @content_array = file.readlines
  end
  # 在 “省/自治区/直辖市” 中选择了 “北京市”
  def select_provinces_array
    arr = []
    content_array.each do |item|
      arr << $1 if item && item.match(/中选择了\ “(\p{Word}+)”/)
    end
    arr
  end

  # expected false, which is without duplication.
  def province_dup?
    condition = false
    province_arr.each {|item|
      if province_arr.select {|nest_item| nest_item == item}.count > 1
        return true
      else
        condition = false
      end
    }
    condition
  end

  private
  def province_arr
    province_arr = content_array.select{ |item| item.match(/中选择了\ “(\p{Word}+)”/) }
  end

end

