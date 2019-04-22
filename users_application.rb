require 'json'

class UsersApplication
  include ApplicationHelpers

  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json"

    case request.path_info
      when request.get? && "", request.get? && "/"
        get_all_users(request, response)
      when %r{/\d+}
        get_a_user(request, response)
    else
      not_found(response, "Not found")
    end

    response.finish
  end

  def get_all_users(request, response)
    respond_with_object(response, Database.users)
  end

  def get_a_user(request, response)
    id = request.path_info.split("/").last.to_i
    user = Database.users[id]
    if user.nil?
      not_found(response, "No user with id #{id}")
    else
      respond_with_object(response, Database.users[id])
    end
  end
end
