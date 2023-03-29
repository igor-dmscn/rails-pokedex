class PokeapiParser
  def self.parse(body:)
    Pokemon.new(name: body['name'])
  end
end
