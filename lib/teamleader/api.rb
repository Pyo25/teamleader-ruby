
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

    # Returns the ID of the company
    def add_company(params={})
      raise "name is required" if params[:name].nil?
      request "/addCompany.php", params
    end

    def get_company(params={})
      raise "company_id is required" if params[:company_id].nil?
      request "/getCompany.php", params
    end

    def get_companies(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getCompanies.php", params
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

    def get_invoice(params={})
      raise "invoice_id is required" if params[:invoice_id].nil?
      request "/getInvoice.php", params
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
