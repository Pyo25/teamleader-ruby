# Teamleader

A ruby wrapper around Teamleader.eu API.

**This Teamleader client is still in development, only a few endpoints are supported (see below).**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'teamleader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teamleader

## Usage

```ruby
require 'teamleader'
teamleader = Teamleader.new('Your API group', 'Your API secret')

```
You can find your API key in your Teamleader account, under Settings > API & Webhooks. API access is available for every Teamleader account.
Note that you need to be admin to access this page.

## Available methods
When a method expects a hash as argument, the hash keys have the same name as described in [Teamleader API documentation](http://apidocs.teamleader.be/).

If a required parameter is missing or if the API returns an error, the method will throw an exception.

### Users

```ruby
teamleader.get_users
```
### Companies

```ruby
teamleader.add_company({:name => "Hello World"})
teamleader.get_company(12345)
teamleader.get_companies({:amount => 100, :pageno => 0, :searchby => "hello"}) # pagination starts at 0
```

### Invoices

```ruby
teamleader.get_invoice(12345)
teamleader.get_invoices({:date_from => "01/01/2017", :date_to => "01/05/2017"})
```

## License
The Teamleader GEM is released under the MIT License.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits
This gem is inspired by the [hunterio gem](https://github.com/prospectio/hunterio/) made by Vincenzo Ruggiero

Made with ️❤️️️ by [Javry](https://javry.com) in Belgium.
