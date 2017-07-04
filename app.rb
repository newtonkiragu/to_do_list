require('sinatra')
require('sinatra/reloader')
require('descriptive_statistics')
require("./lib/task")
also_reload("lib/**/*.rb")

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  task = Task.new(description)
  task.save()
  erb(:success)
end
