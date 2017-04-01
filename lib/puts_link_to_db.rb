require 'rubygems'
require 'data_mapper'


# создание базы данных
DataMapper.setup(:default, 'postgres://user:password@hostname/database')

class Source_url
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :source_url, String    # A varchar type string, for short strings
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

class Link
  include DataMapper::Resource

  property :id,    Serial
  property :link,  String
end


# Один ко многим
# Сообщения могут иметь комментарии, поэтому нам нужно установить простую связь «один ко многим» между:

class Source_url
  has n, :link
end

class Link
  belongs_to :source_url
end
# выход из базы данных
DataMapper.finalize
# DataMapper.auto_migrate! # обновит базу данных (уничтожит все записи и вернет в начальное состояние)
DataMapper.auto_upgrade!


# Записать принятую ссылку из формы бд
def printing_link(url, link)
  unless Link.link.include(link)
  @link=Link.new(:link => link)
  @link.save
  end
  unless Source_url.source_url.include(url)
    @source_url=Source_url.new(:source_url => url)
    @source_url.save
  end
end
