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

### General

```ruby
teamleader.get_users
teamleader.get_departments
teamleader.get_tags
```

### Contacts

```ruby
teamleader.add_contact :forename => "John", :surname => "Doe", :email => "john.doe@provider.com"
teamleader.update_contact({:contact_id => 123, :track_changes => 0, :forename => "Johnny"})
teamleader.delete_contact({:contact_id => 123})
teamleader.link_contact_to_company({:contact_id => 123, :company_id => 456, :mode => "link"})
teamleader.get_contacts({:amount => 100, :pageno => 0, :searchby => "John"}) # pagination starts at 0
teamleader.get_contact({:contact_id => 123})
teamleader.get_contacts_by_company({:company_id => 123})
teamleader.get_contact_company_relations({:amount => 10, :pageno => 0})
```

### Companies

```ruby
teamleader.add_company({:name => "Hello World"})
teamleader.get_company({:company_id => 12345})
teamleader.get_companies({:amount => 100, :pageno => 0, :searchby => "hello"}) # pagination starts at 0
```

### Invoices

```ruby
teamleader.add_invoice({
    :contact_or_company => "company",
    :contact_or_company_id => 12345,
    :sys_department_id => 5678,
    :description_1 => "My awesome item",
    :price_1 => 50,
    :amount_1 => 1
})
teamleader.update_invoice_payment_status({:invoice_id => 123, :status => "paid"})
teamleader.get_invoice({:invoice_id => 123})
teamleader.download_invoice_pdf({:invoice_id => 123})
teamleader.get_invoices({:date_from => "01/01/2017", :date_to => "01/05/2017"})
teamleader.get_creditnotes({:date_from => "01/01/2017", :date_to => "01/05/2017"})
teamleader.get_bookkeeping_accounts({:sys_department_id => 134})
```

### Products

```ruby
teamleader.add_product({
    :name => "My Awesome Product",
    :price => 49.99
})
teamleader.update_product({:product_id => 123, :price => 39.99})
teamleader.get_product({:product_id => 123})
teamleader.delete_product({:product_id => 123})
teamleader.get_products({:amount => 100, :pageno => 0}) # Pagination starts at 0
```
### Tickets

Supported methods are: `add_ticket`, `update_ticket`, `add_ticket_message`, `get_tickets`, `get_ticket`, `get_ticket_messages`, `get_ticket_message`, `get_ticket_cloud_url`.

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
