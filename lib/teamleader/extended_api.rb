
module Teamleader
  # The Api class is a 1-1 mapping with Teamleader API v1
  # The ExtendedApi adds some utility methods
  class ExtendedApi < Api
    def get_all_subscriptions(**args)
      subscriptions = []
      pageno = 0
      loop do
        results = self.get_subscriptions((args || {}).merge({pageno: pageno, amount: 100}))
        subscriptions.concat(results)
        pageno += 1
        break if results.length == 0
      end
      subscriptions
    end
  end
end
