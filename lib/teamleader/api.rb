
require 'json'
require 'net/http'
require 'uri'

module Teamleader
  API_BASE_URL = "https://app.teamleader.eu/api"

  class Api
    def initialize(group, secret)
      @api_group = group
      @api_secret = secret
      uri = URI.parse(API_BASE_URL)
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
    end

    def get_users(params={})
      request "/getUsers.php", params
    end

    def get_departments
      request "/getDepartments.php"
    end

    def get_tags
      request "/getTags.php"
    end

    # Returns the ID of the contact
    def add_contact(params={})
      raise "forename is required" if params[:forename].nil?
      raise "surname is required" if params[:surname].nil?
      raise "email is required" if params[:email].nil?
      request "/addContact.php", params
    end

    def get_contact(params={})
      raise "contact_id is required" if params[:contact_id].nil?
      request "/getContact.php", params
    end

    def update_contact(params={})
      raise "contact_id is required" if params[:contact_id].nil?
      raise "track_changes is required" if params[:track_changes].nil?
      request "/updateContact.php", params
    end

    def delete_contact(params={})
      raise "contact_id is required" if params[:contact_id].nil?
      request "/deleteContact.php", params
    end

    def link_contact_to_company(params={})
      raise "contact_id is required" if params[:contact_id].nil?
      raise "company_id is required" if params[:company_id].nil?
      raise "mode is required" if params[:mode].nil?
      raise "mode must be 'link' or 'unlink'" unless ['link', 'unlink'].include?(params[:mode])
      request "/linkContactToCompany.php", params
    end

    def get_contacts(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getContacts.php", params
    end

    def get_contacts_by_company(params={})
      raise "company_id is required" if params[:company_id].nil?
      request "/getContactsByCompany.php", params
    end

    def get_contact_company_relations(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getContactCompanyRelations.php", params
    end

    def add_deal(params={})
      raise "contact_or_company is required" if params[:contact_or_company].nil?
      raise "contact_or_company_id is required" if params[:contact_or_company_id].nil?
      raise "title is required" if params[:title].nil?
      raise "source is required" if params[:source].nil?
      request "/addDeal.php", params
    end

    def update_deal(params={})
      raise "deal_id is required" if params[:deal_id].nil?
      request "/updateDeal.php", params
    end

    def update_deal_items(params={})
      request "/updateDealItems.php", params
    end

    def send_sale_to_client(params={})
      request "/sendSaleToClient.php", params
    end

    def get_deals(params={})
      raise "mount is required" if params[:mount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getDeals.php", params
    end

    def get_deals_by_contact_or_company(params={})
      raise "contact_or_company is required" if params[:contact_or_company].nil?
      raise "contact_or_company_id is required" if params[:contact_or_company_id].nil?
      request "/getDealsByContactOrCompany.php", params
    end

    def get_deals_by_project(params={})
      raise "project_id is required" if params[:project_id].nil?
      request "/getDealsByProject.php", params
    end

    def get_deal(params={})
      raise "deal_id is required" if params[:deal_id].nil?
      request "/getDeal.php", params
    end

    def get_deal_phase_changes(params={})
      raise "deal_id is required" if params[:deal_id].nil?
      request "/getDealPhaseChanges.php", params
    end

    def get_all_deal_phase_changes(params={})
      raise "date_from is required" if params[:date_from].nil?
      raise "date_to is required" if params[:date_to].nil?
      request "/getAllDealPhaseChanges.php", params
    end

    def get_deal_phases(params={})
      request "/getDealPhases.php", params
    end

    def get_deal_sources(params={})
      request "/getDealSources.php", params
    end

    def add_invoice(params={})
      raise "contact_or_company is required" if params[:contact_or_company].nil?
      raise "contact_or_company_id is required" if params[:contact_or_company_id].nil?
      raise "sys_department_id is required" if params[:sys_department_id].nil?
      request "/addInvoice.php", params
    end

    def update_invoice_payment_status(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      raise "status is required" if params[:status].nil?
      raise "status must be 'paid' or 'not_paid'" unless ['paid', 'not_paid'].include?(params[:status])
      request "/setInvoicePaymentStatus.php", params
    end

    def book_draft_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/bookDraftInvoice.php", params
    end

    def update_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/updateInvoice.php", params
    end

    def update_invoice_comments(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      raise "comments is required" if params[:comments].nil?
      request "/updateInvoiceComments.php", params
    end

    def delete_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/deleteInvoice.php", params
    end

    def get_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/getInvoice.php", params
    end

    def get_creditnote(params={})
      raise "creditnote_id is required" if params[:creditnote_id].nil?
      request "/getCreditnote.php", params
    end

    def download_invoice_pdf(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/downloadInvoicePDF.php", params
    end

    def get_invoices(params={})
      raise "date_from is required" if params[:date_from].nil?
      raise "date_to is required" if params[:date_to].nil?
      request "/getInvoices.php", params
    end

    def get_creditnotes(params={})
      raise "date_from is required" if params[:date_from].nil?
      raise "date_to is required" if params[:date_to].nil?
      request "/getCreditnotes.php", params
    end

    def get_invoices_by_project(params={})
      raise "project_id is required" if params[:project_id].nil?
      request "/getInvoicesByProject.php", params
    end

    def get_creditnotes_by_project(params={})
      raise "project_id is required" if params[:project_id].nil?
      request "/getCreditnotesByProject.php", params
    end

    def get_invoices_by_deal(params={})
      raise "deal_id is required" if params[:deal_id].nil?
      request "/getInvoicesByDeal.php", params
    end

    def add_creditnote(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/addCreditnote.php", params
    end

    def send_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      raise "email_to is required" if params[:email_to].nil?
      raise "email_subject is required" if params[:email_subject].nil?
      raise "email_text is required" if params[:email_text].nil?
      request "/sendInvoice.php", params
    end

    def get_invoice_reminder_templates(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/getInvoiceReminderTemplates.php", params
    end

    def get_invoice_reminder_template_content(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      raise "template_id is required" if params[:template_id].nil?
      request "/getInvoiceReminderTemplateContent.php", params
    end

    def get_invoice_cloud_url(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/getInvoiceCloudURL.php", params
    end

    def get_bookkeeping_accounts(params={})
      raise "sys_department_id is required" if params[:sys_department_id].nil?
      request "/getBookkeepingAccounts.php", params
    end

    def add_product(params={})
      raise "name is required" if params[:name].nil?
      raise "price is required" if params[:price].nil?
      request "/addProduct.php", params
    end

    def update_product(params={})
      raise "product_id is required" if params[:product_id].nil?
      request "/updateProduct.php", params
    end

    def delete_product(params={})
      raise "product_id is required" if params[:product_id].nil?
      request "/deleteProduct.php", params
    end

    def get_product(params={})
      raise "product_id is required" if params[:product_id].nil?
      request "/getProduct.php", params
    end

    def get_products(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getProducts.php", params
    end

    def add_ticket(params={})
      raise "subject is required" if params[:subject].nil?
      request "/addTicket.php", params
    end

    def update_ticket(params={})
      raise "ticket_id is required" if params[:ticket_id].nil?
      request "/updateTicket.php", params
    end

    def add_ticket_message(params={})
      raise "ticket_id is required" if params[:ticket_id].nil?
      raise "message is required" if params[:message].nil?
      request "/addTicketMessage.php", params
    end

    def get_tickets(params={})
      raise "type is required" if params[:type].nil?
      request "/getTickets.php", params
    end

    def get_ticket(params={})
      raise "ticket_id is required" if params[:ticket_id].nil?
      request "/getTickets.php", params
    end

    def get_ticket_messages(params={})
      raise "ticket_id is required" if params[:ticket_id].nil?
      raise "include_internal_message is required" if params[:include_internal_message].nil?
      raise "include_third_party_message is required" if params[:include_third_party_message].nil?
      request "/getTicketMessages.php", params
    end

    def get_ticket_message(params={})
      raise "message_id is required" if params[:message_id].nil?
      request "/getTicketMessage.php", params
    end

    def get_ticket_cloud_url(params={})
      raise "ticket_id is required" if params[:ticket_id].nil?
      request "/getTicketCloudURL.php", params
    end

    def add_note(params={})
      raise "object_type is required" if params[:object_type].nil?
      raise "object_id is required" if params[:object_id].nil?
      raise "note_title is required" if params[:note_title].nil?
      request "/addNote.php", params
    end

    def get_notes(params={})
      raise "object_type is required" if params[:object_type].nil?
      raise "object_id is required" if params[:object_id].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/addNote.php", params
    end

    def add_company(params={})
      raise "name is required" if params[:name].nil?
      request "/addCompany.php", params
    end

    def update_company(params={})
      raise "company_id is required" if params[:company_id].nil?
      raise "track_changes is required" if params[:track_changes].nil?
      request "/updateCompany.php", params
    end

    def delete_company(params={})
      raise "company_id is required" if params[:company_id].nil?
      request "/deleteCompany.php", params
    end

    def get_companies(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getCompanies.php", params
    end

    def get_company(params={})
      raise "company_id is required" if params[:company_id].nil?
      request "/getCompany.php", params
    end

    def get_business_types(params={})
      raise "country is required" if params[:country].nil?
      request "/getBusinessTypes.php", params
    end

    private
    def request(path, data={})
      headers = {
        "Content-Type" => "application/x-www-form-urlencoded"
      }
      data[:api_group] = @api_group
      data[:api_secret] = @api_secret
      data = URI.encode_www_form data
      response = @http.post "/api" + path, data, headers
      code = Integer(response.code)
      if code >= 200 && code < 300
        begin
          JSON.parse response.body, :symbolize_names => true
        rescue
          response.body
        end
      elsif code == 505
        raise "Error: API rate limit reached"
      else
        err = "unknown error"
        begin
          err = JSON.parse(response.body)["reason"]
        rescue
          err = "#{response.body}"
        end
        raise "HTTP Error #{code}: " + err
      end
    end
  end
end
