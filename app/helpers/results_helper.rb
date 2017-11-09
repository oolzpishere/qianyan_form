# coding: utf-8
module ResultsHelper

  # reject rows on results show page
  # reject sign up not includ numbers
  # sign up value is hash
  # 发票单位全称（开发票抬头） ()前后不可有空格，影响筛选

  def compact_empty(param)
    if param.is_a?(Hash)
      param.reject { |k,v| v.empty? }
    elsif param.is_a?(Array)
      param.reject { |item| item.empty? }
    else
      param
    end
  end

end
