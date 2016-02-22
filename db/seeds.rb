User.create(email: "user2@test.com", password: "Password!")
2.times do
  server = Server.create(name: Faker::Lorem.word)
  task_attributes = {
    name: Faker::Lorem.word,
    started_at: Time.now + 1.hours,
    ended_at: Time.now + 2.hours,
    days_of_week: "mon",
    executable_path: "./var/usr",
    server_ids: [server.id]
  }
  Task.create(task_attributes)
end