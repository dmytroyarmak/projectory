class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, :dependent => :destroy, :order => "priority DESC"
  belongs_to :user
  validates :name, :presence => true
end
