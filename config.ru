require_relative 'application'
require_relative 'database'

map("/users") do 
  run Application.new
end
