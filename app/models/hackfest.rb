class Hackfest < ActiveRecord::Base
  has_many :hackers
  has_many :hacks
end
