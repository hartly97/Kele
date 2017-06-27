require 'httparty'
require 'json'

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
      @current_user = JSON.parse(response.body)
    end

#mentor_id 523127
  def get_mentor_availability(mentor_id)
    res = self.class.get("#{@base_uri}/student_availability", headers: {"authorization" => token})
    #res = self.class.get("#{@base_uri}/mentors/#mentor_id}/student_availability"), headers: { "authorization" => token})
     @current_user = JSON.parse(response.body)

  end

  private

  def base_uri(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
