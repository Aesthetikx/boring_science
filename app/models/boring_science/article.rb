module BoringScience
  class Article < ApplicationRecord
    belongs_to :author, polymorphic: true, optional: true

    validates :title, presence: true
    validates :body, presence: true
    validates :slug, presence: true, uniqueness: true

    before_validation :assign_slug

    scope :published, -> { where('publication_date <= ?', Time.zone.today) }

    def to_param
      slug
    end

    def published?
      return false if publication_date.blank?

      publication_date <= Time.zone.today
    end

    private

    def assign_slug
      self.slug = title.presence&.parameterize
    end
  end
end
