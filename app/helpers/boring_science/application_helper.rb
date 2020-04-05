module BoringScience
  module ApplicationHelper
    def boring_science_markdown(source)
      Kramdown::Document.new(source).to_html
    end

    def boring_science_page_title
      items = [boring_science_article, boring_science_blog]
      items.compact.map(&:title).map(&:presence).compact.join(' - ')
    end

    def boring_science_article_date(article)
      str = ''

      str += article.publication_date&.strftime('%B %-d, %Y')

      str += ' (Unpublished)' unless article.published?

      str
    end
  end
end
