module ApplicationHelpers
  def respond_with_object(response, object)
    response.write(JSON.generate(object))
  end

  def error(response, message, status = 400)
    response.status = status
    response.write("ERROR: #{message}")
  end

  def not_found(response, message)
    response.status = 404
    response.write("404: #{message}")
  end

  def missing(request, response)
    response.status = 404
    response.write("Nothing here")
  end
end