module BoringScience
  class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
  end
end
