module BoringScience
  module ApplicationHelper
    def boring_markdown(source)
      Kramdown::Document.new(source).to_html
    end
  end
end
