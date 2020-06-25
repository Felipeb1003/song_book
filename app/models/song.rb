class Song < ActiveRecord::Base
  belongs_to :user
  has_many :setlists
end    