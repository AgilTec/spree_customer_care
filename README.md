SpreeCustomerCare
=================

This extension adds new user role - customer assistant. Each customer have automatically (after creating account) assigned assistant.
Customer is able to contact with his private assistant anytime from special widget.


Demo
----
If you want to see how it works, visit [our demo shop](https://fashion-shop.herokuapp.com).

You can login using those credentials `customer@example.com` / `customer`

Installation
------------

Add spree_customer_care to your Gemfile:

```ruby
gem 'spree_customer_care', git: 'https://github.com/netguru/spree_customer_care/', branch: '2-1-stable'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_customer_care:install
```

If you are adding this extension to existing application you may want to assign assistants to existing users
To do so you can use this rake task:
```shell
rake customer_assistants:assign_to_all_users
```

Additional info
---------------
This extension is using [gravatar.com](http://gravatar.com) to display assistants photo/avatar.

Currently supported Spree version: 2.1.X

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_customer_care/factories'
```

Copyright (c) 2014 [Netguru](https://netguru.co), released under the New BSD License
