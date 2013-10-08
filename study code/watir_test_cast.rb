require 'watir'
require 'test/unit'

class MyTestCase   < Test::Unit::TestCase #< Watir::TestCase

  def browser
    @browser = Watir::Browser.new :ie
  end
  
  def setup
	  browser
  end
  

  # TESTS
  def test_text
    @browser.goto "http://watir.com/"
    assert_equal "Web Application Testing in Ruby", @browser.text
  end

  def test_title
    assert_equal @browser.title == 'Watir'
  end

  def test_link
    assert_equal 'watir.com', @browser.link(:text, 'Home').href
  end

  def test_navigate_to_examples
    @browser.div(:id, 'nav').link(:text, 'Examples').click
  end

  def test_url
    assert_equal @browser.url, 'http://watir.com/examples/'
  end

end