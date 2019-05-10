module Teamleader
  module CustomFields
    def get_custom_fields(params={})
      required_params(%i[for], params)
      request '/getCustomFields.php', params
    end

    def get_custom_field_info(params={})
      required_params(%i[custom_field_id], params)
      request '/getCustomFieldInfo.php', params
    end

    def add_custom_field_option(params={})
      required_params(%i[custom_field_id option_name], params)
      request '/addCustomFieldOption.php', params
    end
  end
end
