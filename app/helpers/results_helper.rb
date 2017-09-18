# coding: utf-8
module ResultsHelper

  # reject rows on results show page
  # reject sign up not includ numbers
  # sign up value is hash
  # 发票单位全称（开发票抬头） ()前后不可有空格，影响筛选
  
  # def reject_rows(rows)
  #   rows.reject do |k,v|
  #     %w(微信头像 微信OpenID 微信昵称 微信性别 微信国家 微信省市 修改时间).include?(k) ||
  #       (!v.to_s.match(/\d/) if %w(广西区内报名 广西区外报名).include?(k))
  #   end
  # end
  
end
