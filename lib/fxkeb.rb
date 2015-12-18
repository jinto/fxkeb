require "fxkeb/version"
require "nokogiri"

module Fxkeb
  FIXED_RATE=1200
  FXURL="http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/2533_0.html"

  def self.fx_krw2usd(krw)
    begin
      s = Net::HTTP.get('community.fxkeb.com', '/fxportal/jsp/RS/DEPLOY_EXRATE/2533_0.html')
      s = s.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "")
      doc = Nokogiri::HTML(s) #.force_encoding('ASCII-8BIT'))#, nil, 'EUC-KR')
      s = doc.css("td.text01")[5].content.to_s
      s = s[1..-1]
      unless s.length==7
        raise "FXKEB changed! s=>[#{s}]"
      end

      #puts "fx => [#{s}]"
      #puts "fx => [#{s.to_f}]"

      return (krw*10/s.to_f).ceil.to_f/10
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      return krw/FIXED_RATE
    end
  end
end
