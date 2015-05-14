class Quote < ActiveRecord::Base
  validates_presence_of :author, :quote
end
