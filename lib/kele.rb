require 'httparty'
class Kele
  include HTTParty

  attr_reader :token, :response

  def initialize(email, password)
      @base_uri = "https://www.bloc.io/api/v1"
      self.class.base_uri @base_uri
      body = {
        "email": email,
        "password": password
      }
      @response = self.class.post("/sessions", { "body": body})

      raise @response.message or 'Login Failed' if @response.code == 401
      raise @response.message or 'Page not found' if @response.code == 404
      raise @response.message or 'Connection failed' unless @response.code == 200

      @token = @response.parsed_response["auth_token"]
    end

    def get_me
      res = self.class.get("#{@base_uri}/users/me", headers: {"authorization" => token})
      @current_user = JSON.parse(res.body)
    end
end
