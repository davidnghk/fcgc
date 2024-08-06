class Taskitem < ApplicationRecord
  belongs_to :task
  belongs_to :workitem

  enum rating: [:A, :B, :C, :D, :E, :NA]
end
