# coding: utf-8
FactoryGirl.define do
  factory :primary_english_result do
    entry { {"序号"=>"30",
             "总价"=>0.04,
             "交易号"=>"",
             "交易状态"=>"未付款",
             "支付渠道"=>"",
             "省/自治区/直辖市"=>"河北省",
             "市/区/县"=>"无",
             "详细地址"=>"与",
             "姓名"=>"李志鹏",
             "性别"=>"男",
             "工作单位"=>"广西南宁四方连续文化传播有限公司",
             "邮箱"=>"oolzpishere@126.com",
             "手机"=>"15977793123",
             "发票单位全称（开发票抬头）"=>"广西南宁四方连续文化传播有限公司",
             "纳税人识别号（统一社会信用代码）"=>"",
             "个人/团体"=>"个人",
             "参会人数"=>"",
             "领队"=>"",
             "参会人姓名"=>"",
             "备注"=>"二次上传",
             "付费方式"=>"现场现金或刷卡交费",
             "广西区内报名"=>{"小英会议"=>"", "预订光盘（套）"=>"", "参赛作品"=>""},
             "广西区外报名"=>{"小英会议"=>"", "预订光盘（套）"=>"2", "参赛作品"=>""},
             "确认码"=>"5398 0547",
             "微信昵称"=>"志page",
             "微信性别"=>"男",
             "微信国家"=>"中国",
             "微信省市"=>{"省"=>"广西", "市"=>"南宁", "区/县"=>"", "详细地址"=>""},
             "微信OpenID"=>"o3jBmt91YRMtZDvZZk-96C20jhSg",
             "微信头像"=>
             "http://wx.qlogo.cn/mmopen/Hm9C4R4iar8Jlo8UDFIicwNJicaqRMLWsDoN5fwEsSia3krxMHx5nSdAFQ2x9LmULAhlSSjDibhoMLAxC80pdicLwHxjDmMHUpEXibv/0",
             "提交人"=>"Page_Lee",
             "提交时间"=>"2017-08-17 02:13:39",
             "修改时间"=>"2017-08-17 02:13:40",
             "填写设备"=>"Android",
             "操作系统"=>"Android 6.0",
             "浏览器"=>"Chrome 53.0.2785.49",
             "IP"=>"113.12.24.243"} }
    sequence(:id)
    form "v9KUmP"
    form_name "小学英语会议报名"
    openid "o3jBmt91YRMtZDvZZk-96C20jhSg"
    gen_code "53980547"
    subject "PrimaryEnglishResult"
    pass { ENV["QIANYAN_FORM_PASS"] }
  end
end
