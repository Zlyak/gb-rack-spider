require 'test/unit'
require 'spider'

class SpiderTest < Test::Unit::TestCase
  def setup
    @spider = Spider.new
  end

  def test_take_link
    link_to_add = 'pavlyut.com'
    @spider.add_link(link_to_add)
    assert_equal true, @spider.links.include?(link_to_add)
  end

  def test_not_double_link

    assert_equal 0, @spider.links.count

    link_to_add = 'pavlyut.com'
    @spider.add_link(link_to_add)
    @spider.add_link(link_to_add)

    assert_equal 1, @spider.links.count
  end

  def test_extract_links
    example_doc = "<html><body><a href='yandex.ru'>yandex</a><a href='pavlyut.com'>Pavlyut</a></body></html>"
    @spider.extract_links_from(example_doc)
    assert_equal 2, @spider.links.count
  end

  def test_store_links
    #code
  end

  def test_print_from_store
    #code
  end
end
