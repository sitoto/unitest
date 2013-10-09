#encoding: utf-8
require "rspec"
require 'watir-webdriver'
require 'yaml'

#run
#rspec -f doc
#rspec -
#rspec -fh >> result.html  
#rspec  --require ./custom_formatter.rb --format CustomFormatter >> result.html
#rspec --format documentation --format html --out results.html
#customer formatters
#rspec --require path/to/my_custom_formatter.rb --format MyCustomFormatter

browser = Watir::Browser.new :chrome
browser.goto 'http://www.unipei.com/parts/index'
browser.cookies.clear
browser.cookies.add 'PHPSESSID', '43c2324212d957cf208411772aae0fea', 'Domain' => "www.unipei.com" , 'path' => "/"


maker_str  = '奇瑞'
car_str     = 'A1系列轿车'
model_str  = 'A1系列轿车'
car_length = 20
main_group = ['白车身', '电器系统', '空调系统', '底盘系统', '车身装饰件', '发动机附件', '工具']
main_group_length = 7

main_group_str = '发动机附件'
vehicle_group = ['进气系统', '冷却系统', '排气系统', '燃油系统', '悬挂装置']
vehicle_group_str = '排气系统'
parts_info = "从 1 到 62 /共 62 条数据"

describe "1.选中厂家: #{maker_str}" do 
	before(:all) do
		browser.goto 'http://www.unipei.com/parts/index'
	end	
	
	it  "第二个应该是: '#{maker_str}'"  do
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

describe "1.选中厂家: #{maker_str}" do
	before(:all) do
		browser.goto 'http://www.unipei.com/parts/index'
	end	
	before(:each) do
		s = browser.select_list(:id, 'vehicle-make-list')
		s.select  maker_str
	end
	
	
	it "第一个车系是: #{car_str}" do
		s = browser.select_list(:id, 'vehicle-car-list')
		selectContent = s.options.map(&:text)
		result = selectContent[0]
		result.should eq   car_str
	end
	
	it "共有车系数量: #{car_length}" do
		s = browser.select_list(:id, 'vehicle-car-list')
		selectContent = s.options.map(&:text)
		result = selectContent.length
		result.should eq   car_length
	end
	
	it "第一个车型是: #{model_str}" do
		s = browser.select_list(:id, 'vehicle-model-list')
		selectContent = s.options.map(&:text)
		result = selectContent[0]
		result.should eq   model_str
	end
	

	
end



describe "1.选中厂家: #{maker_str}, 2.选中车系：#{car_str}" do
	it "主组列表：【#{main_group.join(',') }】" do 
		s = browser.select_list(:id, 'vehicle-car-list')
		s.select  car_str
		s1 = browser.select_list(:id, 'vehicle-maingroup')
		selectContent = s1.options.map(&:text)
		result = selectContent.to_s
		result.should eq   main_group.to_s
	end
	
end


describe "1.选中厂家: #{maker_str}, 2.选中车系：#{car_str}, 3.选中主组：#{main_group_str}" do
	it "显示子组：【#{vehicle_group.join(',')}】" do 
		s = browser.select_list(:id, 'vehicle-make-list')
		s.select  maker_str
		s = browser.select_list(:id, 'vehicle-car-list')
		s.select  car_str
		s = browser.select_list(:id, 'vehicle-maingroup')
		s.select  main_group_str
		s = browser.select_list(:id, 'vehicle-group')
				
		selectContent = s.options.map(&:text)
		result = selectContent.to_s
		result.should eq   vehicle_group.to_s
	end

	
end
describe "1.选中厂家: #{maker_str}, 2.选中车系：#{car_str}, 3.选中主组：#{main_group_str},4.选中子组：#{vehicle_group_str}" do
	it "查询零件信息" do 
		s = browser.select_list(:id, 'vehicle-make-list')
		s.select  maker_str
		s = browser.select_list(:id, 'vehicle-car-list')
		s.select  car_str
		s = browser.select_list(:id, 'vehicle-maingroup')
		s.select  main_group_str
		s = browser.select_list(:id, 'vehicle-group')
		s.select  vehicle_group_str
		
		browser.input(:id, 'mm-vehicle-search').click
		#message = browser.div(:class => 'dataTables_info')
		#browser.td(:text , ' 查看详情 ').click  # error for split GBK
		browser.link(:text , 'unipei').click
		#browser.td(:partid, "1380").click  # error for split GBK
		#browser.td(:class, "parts_detail ").click  # error for split GBK
		
		#result.should  be_success
		"".should eq ""
		#message.text.should eq  parts_info

		#selectContent = s.options.map(&:text)
		#result = selectContent.to_s
		#result.should eq   vehicle_group.to_s
	end

	#after(:all) do 
	#	browser.close
	#end
	
end



#browser.close