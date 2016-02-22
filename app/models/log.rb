class Log < Task
    scope :get_all, -> { where(status: "failed") }
end