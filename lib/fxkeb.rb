require "fxkeb/version"

module Fxkeb
  FXURL="http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/2533_0.html"
  FIXED_RATE=1000

  def self.to_usd(krw)
    begin
      s = Net::HTTP.get('community.fxkeb.com', '/fxportal/jsp/RS/DEPLOY_EXRATE/2533_0.html')
      s = s.encode("UTF-8", :invalid => :replace, :undef => :replace, :replace => "")
      doc = Nokogiri::HTML(s)#.force_encoding('ASCII-8BIT'))#, nil, 'EUC-KR')
      s = doc.css("td.text01")[5].content.to_s
      s = s[1..-1]
      unless s.length==7
        puts "!!!!!!! ERROR !!!!!!! s=>[#{s}]"
      end

      puts "fx => [#{s}]"
      puts "fx => [#{s.to_f}]"

      #doc = Nokogiri::HTML(open(FXURL))
      #return doc.css("td").first
      return (krw*10/s.to_f).ceil.to_f/10
      #return krw/1000
    rescue
      return krw/FIXED_RATE
    end
  end
  # Your code goes here...
end
