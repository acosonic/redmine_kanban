class OverviewKanban < Kanban
  def initialize(attributes={})
    super
    @for = [:assigned_to]
    @fill_incoming = false
    @fill_backlog = true
  end

  def get_users
    u = super
    u.reject {|user| user.is_a?(UnknownUser) }
  end

  # After filtering issues, extract the highest priority one
  def filter_issues(issues, filters = {})
    filtered_issues = super(issues, filters)
    return filtered_issues unless filtered_issues.present?

    # First issue sorted by highest priority
    highest_priority_issue = filtered_issues.sort {|a,b| a.priority.position <=> b.priority.position}.first
    [highest_priority_issue] # expects an Array returned
  end
  
end
