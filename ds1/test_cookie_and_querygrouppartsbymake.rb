require 'mechanize'
require 'pp'

agent = Mechanize.new
cookie = Mechanize::Cookie.new('PHPSESSID', '43c2324212d957cf208411772aae0fea')
cookie.domain = "www.unipei.com"
cookie.path = "/"
agent.cookie_jar.add(URI.parse('http://www.unipei.com/parts/querygrouppartsbymake'), cookie)

#cookie = Mechanize::Cookie.new :domain => '.mydomain.com', :name => name, :value => value, :path => '/', :expires => (Date.today + 1).to_s
#agent.cookie_jar << cookie

page = agent.post('http://www.unipei.com/parts/querygrouppartsbymake', {
  "vehicleEpcID" => 1,
  "maingroupID" => 6,
  "groupID" => 80
})

str =  page.body

#partid=1380&vehicleEpcID=1&maingroupid=6&groupid=80
#http://www.unipei.com/parts/querypartsdetail

=begin
POST http://www.unipei.com/parts/querygrouppartsbymake HTTP/1.1
Host: www.unipei.com
Connection: keep-alive
Content-Length: 39
Accept: text/html, */*; q=0.01
Origin: http://www.unipei.com
X-Requested-With: XMLHttpRequest
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36
Content-Type: application/x-www-form-urlencoded
Referer: http://www.unipei.com/parts/index
Accept-Encoding: gzip,deflate,sdch
Accept-Language: zh-CN,zh;q=0.8
Cookie: PHPSESSID=43c2324212d957cf208411772aae0fea

vehicleEpcID=1&maingroupID=6&groupID=80
=end