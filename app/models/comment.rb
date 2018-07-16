class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #TOOD es literal, pero basicamente permite acceder a la tabla (hacer comments) si :user tiene contendio
  validates_presence_of :user
end
