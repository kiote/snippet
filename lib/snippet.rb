require 'mechanize'
require 'open-uri'

class Snippet
  def initialize(uri)
    @uri = uri
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @agent.agent.http.retry_change_requests = true
  end

  # the only method we need
  # returns hash with {title, content, image}
  # image can be null
  def get_meta
    @doc = @agent.get(@uri)

    Snippet::Facebook.get_meta(@doc) || Snippet::Any.get_meta(@doc)
  end
end

require 'snippet/facebook'
require 'snippet/any'