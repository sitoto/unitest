#encoding: utf-8
require "rspec"
require 'watir-webdriver'
require 'yaml'

#run
#rspec -f doc
#rspec -
#rspec -fh >> result.html  
#rspec  --require ./custom_formatter.rb --format CustomFormatter >> result.html

browser = Watir::Browser.new :chrome
browser.goto 'http://www.unipei.com/parts/index'
browser.cookies.clear
browser.cookies.add 'PHPSESSID', '43c2324212d957cf208411772aae0fea', 'Domain' => "www.unipei.com" , 'path' => "/"


maker_str  = '奇瑞'
car_str     = 'A1系列轿车'
model_str  = 'A1系列轿车'
car_length = 20

describe "下来列表查找厂家 #{maker_str}" do 
	before(:all) do
		browser.goto 'http://www.unipei.com/parts/index'
	end	
	
	it  "第二个应该是 '#{maker_str}'"  do
		s = browser.select_list(:id, 'vehicle-make-list')
		#s.select  maker_str
		#s.selected_options
		selectContent = s.options.map(&:text)
		result = selectContent[1]
		#s.select maker_str
		#selected_options
		#puts result = s.selected_options
		result.should eq maker_str	
		#browser.close
	end
	
	
	
end

describe "选择厂家 #{maker_str} " do
	before(:all) do
		browser.goto 'http://www.unipei.com/parts/index'
	end	
	before(:each) do
		s = browser.select_list(:id, 'vehicle-make-list')
		s.select  maker_str	
	end
	
	
	it "第一个车系是#{car_str}" do
		s = browser.select_list(:id, 'vehicle-car-list')
		selectContent = s.options.map(&:text)
		result = selectContent[0]
		result.should eq   car_str
	end
	
	it "共有车系数量#{car_length}" do
		s = browser.select_list(:id, 'vehicle-car-list')
		selectContent = s.options.map(&:text)
		result = selectContent.length
		result.should eq   car_length
	end
	
	it "第一个车型是#{model_str}" do
		s = browser.select_list(:id, 'vehicle-model-list')
		selectContent = s.options.map(&:text)
		result = selectContent[0]
		result.should eq   model_str
	end
	
	
end

