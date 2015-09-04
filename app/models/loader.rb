

require 'httpclient'


class Loader

  API_URL = "http://pokeapi.co/api/v1".freeze
  CLIENT = HTTPClient.new
  BATCH_SIZE = 50

  attr_accessor :resource_path

  def initialize(resource_path)
    @resource_path = resource_path
    @cache = {}
  end

  def find(id)
    request "#{API_URL}/#{resource_path}/#{id}/"
  end

  def all
    base_url = "#{API_URL}/#{resource_path}/"
    limit = BATCH_SIZE
    offset = 0
    objects = []

    begin
      url = "#{base_url}?limit=#{limit}&offset=#{offset}"
      response = request(url)
      objects += response["objects"]
      offset += limit
    end while response["meta"]["next"]

    objects
  end

  private

  def request(url)
    @cache[url] ||= begin
      response = CLIENT.get_content(url)
      JSON.parse(response) if response
    end
  end
end
