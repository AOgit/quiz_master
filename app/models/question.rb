class Question < ActiveRecord::Base
  has_one :answer, dependent: :destroy
  has_many :choices, dependent: :destroy

  validates :question, presence: true, length: { minimum: 15 }
  validates :exam, presence: true
end
