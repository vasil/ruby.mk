require 'rubygems'
require 'dm-core'
require 'dm-aggregates'
require 'dm-validations'
require 'dm-timestamps'

# Specify your database connection before you define your models

# SQLite connection
#DataMapper.setup(:default, "sqlite3:ruby_mk.db")

# A MySQL connection:
# mysql -u root -p # login to mysql console
# CREATE DATABASE ruby_mk CHARACTER SET = utf8 # create ruby_mk database
DataMapper.setup(:default, 'mysql://root:pass@localhost/ruby_mk')

# A Postgres connection:
# DataMapper.setup(:default, 'postgres://localhost/ruby_mk')

class Post
  include DataMapper::Resource

  property :id,        Serial
  property :title,     String, :nullable => false
  property :permalink, String, :nullable => false
  property :content,   Text,   :nullable => false


  #validates_present :title, :content
  before :valid?, :set_permalink

  has n, :comments # has_many :comments

  private
  def set_permalink
    self.permalink = title.gsub(/\s+/, "-").downcase if title
  end

end

class Comment
  include DataMapper::Resource

  property :id,      Serial
  property :post_id, Integer, :nullable => false
  property :author,  String,  :nullable => false
  property :email,   String,  :nullable => false
  property :url,     String,  :nullable => false
  property :content, Text,    :nullable => false

  #validates_present :post_id, :author, :email, :url, :content

  belongs_to :post
end
