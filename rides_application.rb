require 'json'

class RidesApplication
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json"

    if request.path_info == ""
      if request.post?
        begin
          ride = JSON.parse(request.body.read)
          if ride["user_id"].nil?
            response.status = 400
            response.write("user_id field is required")
          else
            Database.add_ride(ride)
            response.write(JSON.generate({message: "Ride received"}))
          end
        rescue JSON::ParserError
          response.status = 400
          response.write("Invalid JSON")
        end
      else
        response.write(JSON.generate(Database.rides))
      end
    elsif request.path_info =~ %r{/\d+}
      id = request.path_info.split("/").last.to_i
      response.write(JSON.generate(Database.rides[id]))
    else
      response.status = 404
      response.write("Nothing here!")
    end

    response.finish
  end
end

