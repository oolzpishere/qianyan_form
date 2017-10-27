# coding: utf-8

module Xls
  class Post

    attr_reader :file_path,:hashs, :uri, :pass, :subject

    # params: { file, url, subject(class name with CamelCase string)}
    def initialize(ps = {})
      @file_path = ps[:file] || File.join(File.expand_path("../files", __FILE__), "_v9KUmP_小学英语会议报名_20170817162821.xls")
      @hashs = Xls::Parse.new(file: file_path).to_hash
      url = ps[:url] || "http://localhost:3000/results"
      @pass = ENV["QIANYAN_FORM_PASS"]
      @subject = ps[:subject]
      @uri =  gen_uri(url)
    end

    def post(range = 0..-1)
      # rel_range = Range.new(range[0], range[1])
      ranged_hashs = hashs[range]
      ranged_hashs.each do |row|
        req = Net::HTTP::Post.new( uri.path, initheader = {"Content-Type" => "application/json", 'Accept' => 'application/json'} )
        req.body =  row.merge({'pass' => pass, 'subject' => subject}).to_json
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      end
      # Net::HTTP.post( uri, hashs.first.to_json, { "Content-Type" => 'application/json', 'Accept' => 'application/json'} )
    end

    def gen_uri(url)
      uri = URI( url )
      uri.query=( {pass: pass, subject: subject}.to_query )
      uri
    end

  end
end
