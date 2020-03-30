Rails.application.routes.draw do
  # Other Blog
  mount BoringScience.blog, at: '/other',
                            as: :other_blog,
                            options: { title: 'Other Blog', blog: 'other' }

  # Default Blog
  mount BoringScience.blog, at: '/blog'
end
