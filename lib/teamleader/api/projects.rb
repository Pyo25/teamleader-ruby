module Teamleader
  module Projects
    def get_project(params={})
      required_params(%i[project_id], params)
      request '/getProject.php', params
    end

    def get_projects(params={})
      required_params(%i[amount pageno], params)
      request '/getProjects.php', params
    end

    def get_projects_by_client(params={})
      required_params(%i[contact_or_company contact_or_company_id deep_search], params)
      request '/getProjectsByClient.php', params
    end

    def add_project(params={})
      required_params(%i[project_name project_budget project_responsible_user_id project_start_date
         milestone_title milestone_budget milestone_invoiceable milestone_due_date
         milestone_responsible_user_id], params)
      request '/addProject.php', params
    end

    def update_project(params={})
      required_params(%i[project_id track_changes title], params)
      request '/updateProject.php', params
    end
  end
end
