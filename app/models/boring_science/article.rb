module BoringScience
  class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    def published?
      return false if publication_date.blank?

      publication_date <= Time.zone.today
    end
  end
end
