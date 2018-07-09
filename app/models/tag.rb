class Tag < ApplicationRecord
  has_many :taggings
  #TODO Que posts con dichos tags estan relacionados
  has_many :posts, through: :taggings
end
