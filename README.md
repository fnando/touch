# Touch

Touch a parent's collection on ActiveRecord.

## Why not just using `belongs_to :assoc, touch: true`?

Well, you'll have a fine control for each association, since `touch: true` updates the `updated_at` magic field.

## Installation

Add this line to your application's Gemfile:

    gem "touch"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install touch

## Usage

Imagine you have to models:

```ruby
class User < ActiveRecord::Base
  has_many :things
end

class Thing < ActiveRecord::Base
  belongs_to :user
  touch :user
end
```

This new `ActiveRecord::Base.touch` method updates the `User#things_updated_at` attribute every time a new `Thing` is created, updated or removed.

It also updates the parent's `updated_at` field, just like `belongs_to :user, touch: true` configuration.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
