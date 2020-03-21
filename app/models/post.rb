class Post < ApplicationRecord
  belongs_to :user, :optional => true, :dependent => :destroy
  has_many :comments
end
