require 'httparty'
require 'json'
require './lib/roadmap.rb'
#require 'roadmap'

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
    @current_user = JSON.parse(response.body)
    #@get_mentor_availability = JSON.parse(response.body)
  end

  def get_messages(page)
    response = self.class.get("/message_threads", headers: { "authorization" => token })
    #@messages = JSON.parse(response.body)
    @current_user = JSON.parse(response.body)
  end

  def create_message(sender_email, recipient_id, subject, stripped_text)
    response = self.class.post("/messages/", headers: { "authorization" => token }, body: {sender: sender_email, recipient_id: recipient_id, stripped_text: stripped_text, subject: subject })
    JSON.parse(response.body)
  end

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, enrollment_id)#comment,
    # 2162
    response = self.class.post("/checkpoint_submissions/#{checkpoint_id}", headers: { "authorization" => token }, body: { checkpoint_id: checkpoint_id, assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, comment: comment, enrollment_id: enrollment_id })
    JSON.parse(response.body)
  end
end
