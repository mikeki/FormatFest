class Post < ActiveRecord::Base
  attr_accessible :title, :publishedDate, :content
end
