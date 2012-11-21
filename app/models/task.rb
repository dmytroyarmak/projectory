class Task < ActiveRecord::Base
  attr_accessible :deadline, :done, :name, :priority, :project_id
end
