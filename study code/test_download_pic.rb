 require 'watir'
 browser = Watir::Browser.new :ie
 browser.goto 'http://210.14.140.118/JPData/query_v2_2/site/signup'

 idx = 0
 browser.images.each do |x|
   puts idx
   idx += 1
   location = 'c:\tmp\file-' + idx.to_s + '.jpg'
   x.save(location)
 end