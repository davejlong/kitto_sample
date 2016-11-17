defmodule APIs.Jira do
  def issues(filter) do
    jql = URI.encode "filter=" <> to_string(filter) <> "+order+by+priority+DESC,updated+ASC"
    url = URI.parse url <> "/rest/api/2/search?maxResults=25&jql=" <> jql
    HTTPoison.get!(url, authentication).body
    |> Poison.decode!
  end

  def count(issues) do
    issues["total"]
  end

  def issue_for_dashboard(issue) do
    %{label: issue["fields"]["summary"], value: issue["key"]}
  end

  defp username, do: Application.get_env(:sample_dashboard, :jira_username)
  defp password, do: Application.get_env(:sample_dashboard, :jira_password)
  defp url, do: Application.get_env(:sample_dashboard, :jira_url)

  defp authentication, do: ["Authorization": "Basic " <> Base.encode64("#{username}:#{password}")]
end
