# coding: utf-8
class Entry

  attr_reader :result, :entry, :form, :form_name, :file_pair
  
  # hd=hash_data
  # [params] Result.any
  def initialize(result) 
    @result = result
    @entry = result.entry
    @form = result.form
    @form_name = result.form_name
    # key_type = eng_key? ? "eng" : "chinese"
    @file_pair = Xxml::XmlFactory.new().name_pair
  end

  def values
    eng_key? ? change_name : filter_entry
  end
  
  # from {"serial_number" =>123, ... } become {"序号" => 123, ... }
  # from english name change to chinese name
  # eg. serial_number to 序号
  def change_name
    filter_entry.inject({}) { |h, (k,v)| h[file_pair[k]] = v; h }
    # buf_entry = eng_key? ? filter_entry("keys") : filter_entry("values")
    # mem = {} 
    # # from {"serial_number" =>123, ... } become {"序号" => 123, ... }
    # filter_entry.each do |h|
    #   hk, hv = h
    #   real_name = file_pair[hk] 
    #   mem[real_name] = hv
    # end
    # mem
    # a_new_hash = my_hash.inject({}) { |h, (k, v)| h[k] = v.upcase; h } 
  end

  # 对应不上最新field name的则不显示
  # english key use keys or chinese key use values from file_pair
  def filter_entry
    key_type = eng_key? ? "keys" : "values"
    entry_to_h.select do |k, _|
      keys = file_pair.send(key_type)
      keys.include?(k)
    end
  end

  def eng_key?
    entry_to_h.keys.any? {|k| k.match(/serial/) || k.match(/field/)}
  end

  # json post from jinshuju, product if not choose number, it's not show the product and number.
  def entry_to_h
    JSON.parse entry.gsub('=>', ':') # .gsub('nil', "\"\"")
  end
end
