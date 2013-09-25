require 'rubygems'
require 'watir'
require 'watir-classic/screenshot'
#require 'watir-webdriver'
require 'yaml'
require 'test/unit'
require 'pp'
class ManagerLogin < Test::Unit::TestCase
#include Watir::Exception
#include Watir::Screenshot

  def getEnvInfor (env_id) 
    #YAML::ENGINE.yamler = 'syck'  #old
    #YAML::ENGINE.yamler = 'Psych'  #new
    #data = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'env.yml'))

    File.open('env.yml')  do |yf| 
    #YAML.each_document(yf)   do |data|  # old for syck
    YAML.load_stream(yf).each do |data| 
       #puts data
       if data['ENV_ID'] == env_id 
         $test_url = data['ENV_Infor']['TEST_URL'] 
         $username = data['ENV_Infor']['USERNAME'] 
         $password = data['ENV_Infor']['PASSW0RD'] 
         $test_data_file = data['ENV_Infor']['TEST_DATA_FILE']
	 $capture_pic = 'ard'
       end
      end #end data
    end #end yf
    
    
  end
  
  def setup 
    getEnvInfor ('Env1')                      # 获取环境信息

#    if ! defined? $logger                     # 初始化日志
#      $logger = LoggerFactory.start_xml_logger(FILE_PREFIX)
#    end
#    if !defined? $screen                      # 初始化截屏对象
#      $screen = Watir::Screenshot.new
#    end

  #  if !defined? $browser                 # 初始化 IE 浏览器
  #    $browser = Watir::IE.attach(:url, "http://210.14.140.118/JPData/manager/auth/login")
  #  end
    #login($USERNAME, $PASSW0RD)                    # 登录应用
  end 


  
  
  
  def test_login
      $browser = Watir::Browser.new :ie
      $browser.goto($test_url)
      #ie = Watir::IE.start "http://www.baidu.com/"
      $browser.text_field(:id, "name").set $username
      $browser.text_field(:id, "pass").set $password
      $browser.input(:name, "slogin").click
      #$browser .maximize
      assert_equal($browser .title,"嘉配后台管理系统 - Default")

      $browser.screenshot.save ("#{@@filename}.png")
      #ie.link(:text, "P").click
  end

  
  def teardown 
    #logout()                                      # 退出应用
    $browser.close if defined? $browser             # 关闭 IE 浏览器
  end
end