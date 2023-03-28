module Http
  class PokeapiClient
    POKEAPI_BASE_URL = 'https://pokeapi.co/api/v2/'
    private_constant :POKEAPI_BASE_URL

    attr_reader :conn

    def initialize
      @conn = Faraday.new(url: POKEAPI_BASE_URL) do |f|
        f.request :json
        f.response :json
      end
    end

    class << self
      def get(resource, params = nil, headers = nil)
        PokeapiClient.new.conn.get(resource, params, headers)
      end
    end
  end
end
