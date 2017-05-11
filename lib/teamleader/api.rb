
require 'json'
require 'net/http'
require 'uri'

# require File.expand_path(File.join(File.dirname(__FILE__), 'domain_search'))
# require File.expand_path(File.join(File.dirname(__FILE__), 'email_count'))
# require File.expand_path(File.join(File.dirname(__FILE__), 'email_finder'))
# require File.expand_path(File.join(File.dirname(__FILE__), 'email_verifier'))

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

    def get_users
      request "/getUsers.php"
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
      request "/getCompanies.php", params
    end

    def get_company(id)
      request "/getCompany.php", {:company_id => id}
    end

    def get_companies(params={})
      raise "amount is required" if params[:amount].nil?
      raise "pageno is required" if params[:pageno].nil?
      request "/getCompanies.php", params
    end

    def add_invoice(params={})
      raise "contact_or_company" if params[:contact_or_company].nil?
      raise "contact_or_company_id" if params[:contact_or_company_id].nil?
      raise "sys_department_id" if params[:sys_department_id].nil?
      request "/addInvoice.php", params    
    end

    def get_invoice(id)
      request "/getInvoice.php", {:invoice_id => id}
    end

    def get_invoices(params={})
      raise "date_from is required" if params[:date_from].nil?
      raise "date_to is required" if params[:date_to].nil?
      request "/getInvoices.php", params
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
        JSON.parse response.body, :symbolize_names => true
      elsif code == 505
        raise "Error: API rate limit reached"
      else
        begin
          m = JSON.parse response.body
          raise "HTTP Error #{code}: " + m["reason"]
        rescue
          raise "HTTP Error #{code}: " + response.body
        end
      end
    end
  end
end
