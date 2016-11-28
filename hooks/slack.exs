use Kitto.Hooks.DSL

hook :slack do
  IO.inspect conn.params
  %{"text" => text} = conn.params
  broadcast! :slack_message, text
end
