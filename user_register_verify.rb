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
    $test_url = "http://210.14.140.118/JPData/query_v2_2/site/signup" 
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
         #$test_data_file = data['USER_Infor']['TEST_DATA_FILE']
	 $capture_pic = env_id
       end #end if
      end #end data
    end #end yf
  end    

  def checkcode(image_src)
#      puts image_src
      checkout = ''
=begin      
      File.open("C:\\CheckImg.png", "wb") do |file|
        open(gifurl) do |read_file|
           file.write(read_file.read)
        end
        file.close
      end
    
#      require 'net/http'
#      resp = Net::HTTP.get_response(URI(image_src))
#      
#      File.open("C:\\CheckImg.jpg", "wb") do |file|
#        file.write(resp.body)
#        file.close
#      end
=end    
      system("c:\\CheckBat.bat")
      if File.exists?("c:\\CheckCode.txt") ==true
        File.open("c:\\CheckCode.txt","r") do |line|
          checkout = line.readline
          line.close
        end
      end
      puts checkout
      return checkout
  end   

  
  def setup 
    getEnvInfor ('Env1')                      # 获取环境信息
  end 
  
  def test_reg
      $browser = Watir::Browser.new :ie
      #$browser = Watir::Browser.new :chrome
      #$browser = Watir::Browser.new :ff
      
      $browser.goto($test_url)
      
      image_src = $browser.img(:id, "yw0").src
      puts path = "c:\\checkimg.png"
      system("del c:\\checkimg.png")
      $browser.image(:id , "yw0").save(path)
      #pp $browser.img(:id , "yw0")
      
#      File.open(location, 'wb') do |f|
#        f.write open(image_src).read
#      end
      
      
      code = checkcode(image_src)
      $browser.text_field(:id, "UserForm_verifyCode").set code
      
      $txt_arr.each do |object|
        $browser.text_field(:id, object["id"]).set object["value"]
      end
      $select_arr.each do |object|
	$browser.select_list(:id, object["id"]).select object["value"]
      end
      
      $browser.input(:name, "yt0").click
      #$browser .maximize
      result = assert_equal($browser .title,"注册 - 嘉配数据知识平台查询系统")

      #$browser.screenshot.save ("#{$capture_pic}.png") unless result
      #ie.link(:text, "P").click
  end

  
  def teardown 
    #logout()                                      # 退出应用
    #$browser.close if defined? $browser             # 关闭 IE 浏览器
  end




end