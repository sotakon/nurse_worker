module RumorsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_rumors_path
    elsif action_name == 'edit'
      rumor_path
    end
  end
end
