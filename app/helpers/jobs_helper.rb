module JobsHelper
  def new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_jobs_path
    elsif action_name == 'edit'
      job_path
    end
  end
end
