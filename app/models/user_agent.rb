require 'user_agent'

string = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5'

user_agent = UserAgent.parse(string)
puts user_agent.browser
# => 'Chrome'
puts user_agent.version
# => '19.0.1084.56'
puts user_agent.platform
# => 'Macintosh'
puts user_agent.os
