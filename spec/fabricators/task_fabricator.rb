Fabricator :task do
  name { Faker::Lorem.word }
  days_of_week "mon"
  executable_path { Faker::Lorem.word }
  started_at Time.now + 1.hours
  ended_at Time.now + 2.hours
  servers { [ Fabricate(:server) ] }
end