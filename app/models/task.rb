class Task < ActiveRecord::Base
  attr_accessible :deadline, :done, :name, :priority, :project_id
  belongs_to :project
end
