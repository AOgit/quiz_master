class Choice < ActiveRecord::Base
  belongs_to :question
  validates :choice, presence: true
end
