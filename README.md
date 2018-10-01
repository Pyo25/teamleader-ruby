# Teamleader

A ruby wrapper around Teamleader.eu API v1.

**Some endpoints are still missing. Don't hesitate to open an issue or a PR if you need one of them.**

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

### Configuration
For Rails application create a configuration file `config/initializers/teamleader.rb`. You can do this anywhere in your application before you make API calls using the gem.

```ruby
Teamleader.configure do |config|
  config.api_group = '45678'
  config.api_secret = '31e56cf3b3c259f56666ba4a6089ee91c3150683611834f7eb2f5a7a4f039a17910f1fa2d65d282e9c344abcf895dad80a89b13af8fe917dfed1e0798c83350c'
end
```

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

### Deals

Supported methods are: `add_deal`, `update_deal`, `update_deal_items`, `send_sale_to_client`, `get_deals`, `get_deals_by_contact_or_company`, `get_deals_by_project`, `get_deal`, `get_deal_phase_changes`, `get_all_deal_phase_changes`, `get_deal_phases`, `get_deal_sources`

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

#### Other supported methods
`book_draft_invoice`, `update_invoice`, `update_invoice_comments`, `delete_invoice`, `get_creditnote`, `get_invoices_by_project`, `get_creditnotes_by_project`, `get_invoices_by_deal`, `add_creditnote`

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

### Projects

```ruby
teamleader.get_project({ :project_id => 123 })
teamleader.get_projects_by_client({
  contact_or_company: 'contact',
  contact_or_company_id: '123',
  deep_search: 1
})

teamleader.add_project({
  :project_name => 123,
  :project_budget => 300,
  :project_responsible_user_id => 123,
  :project_start_date => '12/01/2017',
  :milestone_title => 'milestone title',
  :milestone_budget => 200,
  :milestone_invoiceable => 0,
  :milestone_due_date => '12/03/2017',
  :milestone_responsible_user_id => 123
})
teamleader.update_project({
  :project_id => 123,
  :track_changes => 0,
  :title => "New Project Title"
})
teamleader.get_projects({ :amount => 50, pageno: 0 })
# Pagination starts at 0
```
### Tickets

Supported methods are: `add_ticket`, `update_ticket`, `add_ticket_message`, `get_tickets`, `get_ticket`, `get_ticket_messages`, `get_ticket_message`, `get_ticket_cloud_url`.

### Notes

Supported methods are: `add_note`, `get_notes`

### Files

```ruby
teamleader.get_file_info({ :file_id => '1236412' })

teamleader.download_file({ :file_id => '1236412' })

teamleader.upload_file({
  :object_type => 'company',
  :object_id => '1236412',
  :file_content => 'Base64 encoded version the file',
  :file_name => 'file.rb'
})

teamleader.delete_file({ :file_id => '1236412' })

teamleader.get_files({
  :amount => 100,
  :pageno => 0,
  :object_type => 'contact',
  :object_id => '1234567'
})
# Pagination starts at 0
```

### Callbacks
```ruby
teamleader.add_callback({
  due_date: 1538400423,
  hour: '10h15',
  user_id: '1234',
  for: 'contact',
  for_id: '9876'
})
teamleader.get_calls(amount: 10, pageno: 0)
teamleader.get_call(call_id: '123456')
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
