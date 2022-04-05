module Ponto
  class AccessToken < Ponto::OAuthResource
    def self.create(client = Ponto.client)
      uri = Ponto.api_schema["oauth2"]["token"]
      payload = URI.encode_www_form([["grant_type", "client_credentials"]])
      headers = {
        authorization: "Basic " + Base64.strict_encode64("#{client.client_id}:#{client.client_secret}"),
        content_type: "application/x-www-form-urlencoded"
      }
      create_by_uri(uri: uri, payload: payload, headers: headers)
    end
  end
end
