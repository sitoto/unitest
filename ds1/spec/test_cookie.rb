#encoding: utf-8
require "rspec"
require 'watir-webdriver'
require 'yaml'

browser = Watir::Browser.new :chrome

browser.goto 'http://www.unipei.com/parts/index'
browser.cookies.clear
browser.cookies.add 'PHPSESSID', '43c2324212d957cf208411772aae0fea', 'Domain' => "www.unipei.com" , 'path' => "/"

browser.goto 'http://www.unipei.com/parts/index'

maker_str = '奇瑞'

describe "search makers" do 
	
	it  "the first should be '#{maker_str}'"  do
		s = browser.select_list(:id, 'vehicle-make-list')
		#s.select maker_str
		maker_str.should eql  s.selected_options[1]
	end
	
end
