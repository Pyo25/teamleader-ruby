module Teamleader
  module Calls
    def add_callback(params={})
      required_params(%i[due_date hour user_id for for_id], params)
      request '/addCallback.php', params
    end

    def get_calls(params={})
      required_params(%i[amount pageno], params)
      request '/getCalls.php', params
    end

    def get_call(params={})
      required_params(%i[call_id], params)
      request '/getCall.php', params
    end
  end
end
