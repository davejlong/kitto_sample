use Kitto.Job.DSL

filters = [
  "high_priority": "12200", # <= All open issues with critical or higher priority
  "bugs": "10100" # <= All open bugs
]

Enum.each(filters, fn ({name, filter}) ->
  job name, every: {5, :minutes} do
    issues = APIs.Jira.issues(filter)

    list = %{items: issues["issues"] |> Enum.map(&APIs.Jira.issue_for_dashboard/1)}
    count = %{value: APIs.Jira.count(issues)}

    broadcast! to_string(name) <> "_list", list
    broadcast! to_string(name) <> "_count", count
  end
end)
