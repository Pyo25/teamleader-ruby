module Teamleader
  module Files
    def get_files(params={})
      required_params(%i[amount pageno object_type object_id], params)
      request '/getFiles.php', params
    end

    def get_file_info(params={})
      required_params(%i[file_id], params)
      request '/getFileInfo.php', params
    end

    def download_file(params={})
      required_params(%i[file_id], params)
      request '/downloadFile.php', params
    end

    def upload_file(params={})
      required_params(%i[object_type object_id file_content file_name], params)
      request '/uploadFile.php', params
    end

    def delete_file(params={})
      required_params(%i[file_id], params)
      request '/deleteFile.php', params
    end
  end
end
