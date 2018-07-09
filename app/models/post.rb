class Post < ApplicationRecord
  #TODO has_many es un macro que se encarga de hacer la magia para que este modelo haga referencia a otros modelos (one to many relasonship)
  has_many :comments

  has_many :taggings
  #TODO Que tag con dichos tags estan relacionados
  has_many :tags, through: :taggings
end
