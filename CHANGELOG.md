# Changelog
All notable changes to this project will be documented in this file.

## [0.17.1] - 2020-04-09
- Fix include

## [0.17.0] - 2020-04-09
- `get_all_subscriptions` method accepts optional parameters (like `selected_customfields` or `searchby`)
- New methods related to subscriptions: `add_subscription`, `update_subscription`, `delete_subscription`, `get_subscription`, `get_invoices_by_subscription`, `get_related_subscriptions_by_invoice`, `get_subscriptions_by_deal`, `get_subscriptions_by_contact_or_company`

## [0.16.0] - 2019-05-10
- New method related to custom fields: `get_custom_fields`, `get_custom_field_info`, `add_custom_field_option`

## [0.15.0] - 2019-05-09
- New method related to credit notes: `download_creditnote_pdf`

## [0.14.0] - 2018-10-01
- Sync with version published on Rubygems

## [0.13.0] - 2018-10-01
### Added
- New methods related to calls: `get_calls`, `get_call`, `add_callback`

## [0.12.0] - 2018-03-28
### Added
- New methods related to subscriptions: `get_subscriptions`, `get_all_subscriptions`

## [0.11.1] - 2018-03-07
### Fixed
- Error when the API responds with an error but no `reason` attribute in the response body.

## [0.11.0] - 2018-02-15
### Added
- New methods related to invoices and credit notes: `book_draft_invoice`, `update_invoice`, `update_invoice_comments`, `delete_invoice`, `get_creditnote`, `get_invoices_by_project`, `get_creditnotes_by_project`, `get_invoices_by_deal`, `add_creditnote`

## [0.10.0] - 2018-01-09
### Added
- All methods related to companies: `add_company`, `update_company`, `delete_company`, `get_companies`, `get_company`, `get_business_types`

## [0.9.0] - 2018-01-05
### Added
- Some methods related to notes: `add_note`, `get_notes`

## [0.8.0] - 2017-11-08
### Added
- Some methods related to invoices: `send_invoice`, `get_invoice_reminder_templates`, `get_invoice_reminder_template_content`, `get_invoice_cloud_url`

## [0.7.0] - 2017-11-08
### Added
- Methods for manipulating Deals

## [0.6.0] - 2017-10-31
### Added
- `get_creditnotes` method

## [0.5.1] - 2017-10-17
### Fixed
- Relax required parameters for `add_ticket` method.

## [0.5.0] - 2017-10-16
### Added
- Add methods for manipulating Tickets

## [0.4.0] - 2017-09-28
### Added
- Add support for getting bookkeeping accounts (cfr `get_bookkeeping_accounts` method)

## [0.3.1] - 2017-05-12
### Fixed
- Parameter check for `link_contact_to_company`

## [0.3.0] - 2017-05-12
### Added
- Methods for Contacts (add, get, update, delete, link to company, search, get contacts from a company, get relationships between contacts and companies)

## [0.2.0] - 2017-05-12
### Added
- Method `link_contact_to_company`
- Methods for Products (add, update, delete, get one, get all)
- Methods for Invoice (add, update payment status, get PDF, get one, get all)
- Update `get_company` to accept an Hash instead of an id as parameter

## [0.1.1] - 2017-05-12
### Changed
- Mark `json` dependency version as `>= 1`

## [0.1.0] - 2017-05-11
### Added
- Initial commit
