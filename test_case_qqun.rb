require 'rubygems'
require 'watir'
require 'watir-classic/screenshot'
#require 'watir-webdriver'
require 'yaml'
require 'test/unit'
require 'pp'
require 'open-uri'
class UserRegister < Test::Unit::TestCase
#include Watir::Exception
#include Watir::Screenshot

  def getEnvInfor (env_id) 
    $test_url = "http://qun.qzone.qq.com/" 
    $txt_arr = []
    $select_arr = []
    
    File.open('user.yml')  do |yf| 
    YAML.load_stream(yf).each do |data| 
       if data['USER_ID'] == env_id 
	data['USER_Infor'].each do |key , value|
	  $txt_arr <<  {"id" => key, "value" => value}
	end
 	data['USER_select'].each do |key , value|
	  $select_arr <<  {"id" => key, "value" => value}
	end
	 $capture_pic = env_id
       end #end if
      end #end data
    end #end yf
  end    

  def checkcode(checkout)
      system("c:\\CheckBat.bat")
      if File.exists?("c:\\CheckCode.txt") ==true
        File.open("c:\\CheckCode.txt","r") do |line|
          checkout = line.readline
          line.close
        end
      end
      checkout
  end   

  
  def setup 
    #getEnvInfor ('Env1')                      # 获取环境信息
    $test_url = "http://qun.qzone.qq.com/" 
  end 
  
  def test_reg
      $browser = Watir::Browser.new :chrome
      #$browser.goto($test_url)
      
      #path = "c:\\checkimg.png"
      #system("del #{path}")
      #$browser.image(:id , "yw0").save(path)
      
      #code = checkcode("")
      #$browser.text_field(:id, "UserForm_verifyCode").set code
      
      
      #$browser.input(:id, "login_button").click

      $browser.goto('http://qqun.qq.com/cgi-bin/qun_search/search_group?k=%E6%B1%BD%E9%85%8D&p=1&n=8&c=1&t=0&st=1&r=0.010035616747952447&d=1&bkn=969357716&v=3493')


      #$browser.screenshot.save ("#{$capture_pic}.png")
      #ie.link(:text, "P").click
  end

  
  def teardown 
    #logout()                                      # 退出应用
    #$browser.close if defined? $browser             # 关闭 IE 浏览器
  end




end