class Post < ActiveRecord::Base
  attr_accessible :body, :title, :comments_attributes
  has_many :comments
  accepts_nested_attributes_for :comments
end
