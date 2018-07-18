class Post < ApplicationRecord

  # Active record enum gem 'stateful_enum'
  enum status: {draft: 0, published: 1} do
    event :publish do
      after do
        self.published_at = DateTime.now
        self.save
      end
      transition :draft => :published
    end
  end

  #TODO has_many es un macro que se encarga de hacer la magia para que este modelo haga referencia a otros modelos (one to many relasonship)
  has_many :comments

  has_many :taggings
  #TODO Que tag con dichos tags estan relacionados
  has_many :tags, through: :taggings
end
