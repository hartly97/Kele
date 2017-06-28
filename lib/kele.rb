require 'httparty'
require 'json'
require './lib/roadmap.rb'

class Kele
  include HTTParty
  include Roadmap
  attr_reader :token, :response

  def initialize(email, password)
      self.class.base_uri("https://www.bloc.io/api/v1")
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
      response = self.class.get("/users/me", headers: {"authorization" => token})
      @current_user = JSON.parse(response.body)
  end

    #mentor_id 523127
  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: {"authorization" => token})
    #@current_user = JSON.parse(response.body)
    @get_mentor_availability = JSON.parse(response.body)
  end
end
