# Garnish

Garnish is a minimal decorator for Rails, it requires almost no configuration and relies on Rails constant lookup. Some design decision that make it distinct from conventional rails decorators are:

* use of an objects singleton class to extend functionality instead of `method missing` and thereby avoids the performance penalty associated with the `method_missing` method lookup. 
* objects can only be decorated inside of controllers, thereby making it impossible to create unexpected dependencies in other places (such as views)
* as mentioned delegation of method calls happens via the object chain and need not be an explicit concern
* The view_context is implicit inside the decorators and need not be passed explicitly

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garnish'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garnish

## Usage

* Add this line to your ApplicationController, that is all the configuration require

```
class ApplicationController < ActionController::Base

  ...

  include Garnish::Base

  ...
end
```
Anywhere in your controllers you can now call `decorate(@my_model)` to decorate your object with a module defined in `decorators/my_model_decorator.rb`. The view context is automatically available to those decorators as `helpers`.

In order to decorate a method that is defined in your active record class you have two option: 

* Call super inside your decorator method if the method from the decorated model has the same signature ex.

```
module MyModelDecorator 

  ...

  def living_in_model
  	puts 'I am enhancing the model method'
  	super
  end

  ...
end
```

* Alternatively the active record model is available to you inside the decorator as `model`

```
module MyModelDecorator 

  ...

  def living_in_decorator
  	puts 'I need help from the model'
  	model.living_in_model
  end

  ...
end
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/garnish/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

