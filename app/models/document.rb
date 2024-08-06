class Document < ApplicationRecord
  include AASM
  
  belongs_to :team
  has_many_attached :uploadfiles

  validates :description, presence: true
  validates :uploadfiles, presence: true

  before_create :set_code

  aasm do
    state :booked, :initial => true
    state :inProgress, :completed, :cancelled, :approved

    event :cancel do
      transitions from: :booked, to: :cancelled
    end
    event :start do
      transitions from: :booked, to: :inProgress 
    end
    event :complete do
      transitions from:  :inProgress, to: :completed
    end  
    event :approve do
      transitions from:  :completed, to: :approved
    end  
  end

private

  def set_code
    self.code ||= self.id.to_s 
  end

  def set_code
    max_code = Document.maximum(:code)
    cur_year = Date.current.year - 2000 
    if max_code.to_i > cur_year * 10000
      self.code = (max_code.to_i + 1).to_s
    else 
      self.code = (cur_year * 100000 + 1).to_s
    end 
  end

end
 