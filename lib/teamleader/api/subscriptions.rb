module Teamleader
  module Subscriptions
    def add_subscription(params={})
      required_params(%i[contact_or_company contact_or_company_id sys_department_id date_start repeat_after title], params)
      request '/addSubscription.php', params
    end

    def update_subscription(params={})
      required_params(%i[subscription_id], params)
      request '/updateSubscription.php', params
    end

    def delete_subscription(params={})
      required_params(%i[subscription_id], params)
      request '/deleteSubscription.php', params
    end

    def get_subscriptions(params={})
      required_params(%i[amount pageno], params)
      request "/getSubscriptions.php", params
    end

    def get_subscription(params={})
      required_params(%i[subscription_id], params)
      request '/getSubscription.php', params
    end

    def get_invoices_by_subscription(params={})
      required_params(%i[subscription_id], params)
      request '/getInvoicesBySubscription.php', params
    end

    def get_related_subscriptions_by_invoice(params={})
      required_params(%i[invoice_id], params)
      request '/getRelatedSubscriptionsByInvoice.php', params
    end

    def get_subscriptions_by_deal(params={})
      required_params(%i[deal_id], params)
      request '/getSubscriptionsByDeal.php', params
    end

    def get_subscriptions_by_contact_or_company(params={})
      required_params(%i[contact_or_company contact_or_company_id], params)
      request '/getSubscriptionsByContactOrCompany.php', params
    end
  end
end
