require 'rubygems'
require 'watir'
require 'test/unit'
class Admin_login < Test::Unit::TestCase
  def test_admin_login
    i=1
    for i in 1...2
      ie = Watir::Browser.new :ie
      ie.goto("http://210.14.140.118/JPData/manager/auth/login")
      #ie = Watir::IE.start "http://www.baidu.com/"
      ie.text_field(:id, "name").set "admin"
      ie.text_field(:id, "pass").set "123456"
      ie.input(:name, "slogin").click
      #ie.link(:text, "P").click
      i=i+1
    end
  end

end