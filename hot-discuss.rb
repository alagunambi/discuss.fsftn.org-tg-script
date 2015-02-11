require 'discourse_api'

client = DiscourseApi::Client.new("http://discuss.fsftn.org")
client.api_key = <api-key here>
client.api_username = <username here>

# Fetching first of latest topics (the most recent)
first_topic = client.latest_topics.first

# combining post topic and its URL
post_content = first_topic["title"].to_s + " for more info http://discuss.fsftn.org/t/" + first_topic["slug"].to_s

# Generating command
exec_command = "tg-gm " + '"' + post_content.to_s + '"'

if !first_topic.nil?
  exec("#{exec_command}")
end

