User.find_or_create_by(email: 'user@test.com') do |user|
  user.password = 'Password!'
end
2.times do
  server = Server.create(name: Faker::Lorem.word)
  task_attributes = {
    name: Faker::Lorem.word,
    started_at: Time.now + 1.hours,
    ended_at: Time.now + 2.hours,
    days_of_week: "mon",
    executable_path: "./var/usr",
    server_ids: [server.id],
    status: "unstarted"
  }
  Task.create(task_attributes)
end

3.times do
  server = Server.create(name: Faker::Lorem.word)
  task_attributes = {
    name: Faker::Lorem.word,
    started_at: Time.now + 1.hours,
    ended_at: Time.now + 2.hours,
    days_of_week: "mon",
    executable_path: "./var/usr",
    server_ids: [server.id],
    status: "failed"
  }
Task.create(task_attributes)
end
