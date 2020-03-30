<h1><i>Boring Science</i></h1>

A mountable Rails blogging engine.

<img src="https://vignette.wikia.nocookie.net/spongebob/images/8/87/The_Paper_088.png/revision/latest" width=256></img>

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'boring_science'
```

And then execute:
```bash
$ bundle
```

Copy migrations to your application and migrate:
```bash
$ rails boring_science:install:migrations
$ rails db:migrate
```

## Usage
Add a blog to your applications routes:
```
# config/routes.rb
Rails.application.routes.draw do

  # ...

  # Default Blog
  mount BoringScience.blog, at: '/blog'

  # Second Blog
  mount BoringScience.blog, at: '/other',
                            as: :other_blog,
                            options: { title: 'Other Blog', blog: 'other' }
end
```

Define a blogging user (can be nil for read only access):
```
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base

  # ...

  def boring_science_user
    current_user
  end
end
```

## Contributing
Pull requests welcome.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
