require 'nokogiri'
class Spider
  attr_accessor :links

  def initialize
    @links = []
  end

  # пограмма должна принимать на вход любую ссылку
  def add_link(link)
    @links << link unless @links.include? link
  end

  # выкачивать на странице все ссылки которые есть
  def extract_links_from(doc)
    doc_object = Nokogiri::HTML(doc)
    doc_object.css('a').each do |link|
      add_link link['href']
    end
  end

  # записывать их в файл txt.
  def store_links
    #code
  end

  # содержание которого после выводит на экран.
  def print_from_store
    #code
  end
end
