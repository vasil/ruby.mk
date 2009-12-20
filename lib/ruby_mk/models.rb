require 'rubygems'
require 'dm-core'
require 'dm-aggregates'
require 'dm-validations'
require 'dm-timestamps'

class Post
  include DataMapper::Resource

  property :id,        Serial
  property :title,     String, :required=>true
  property :permalink, String, :required=>true
  property :content,   Text,   :required=>true


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
  property :post_id, Integer, :required=>true
  property :author,  String,  :required=>true
  property :email,   String,  :required=>true
  property :url,     String,  :required=>true
  property :content, Text,    :required=>true

  #validates_present :post_id, :author, :email, :url, :content

  belongs_to :post
end

