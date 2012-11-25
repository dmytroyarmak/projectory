class Task < ActiveRecord::Base
  attr_accessible :deadline, :done, :name, :priority, :project_id
  belongs_to :project
  validates :priority, :numericality => { :only_integer => true }
  validates :name, :project_id, :presence => true
end
