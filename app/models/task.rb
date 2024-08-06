class Task < ApplicationRecord
  include AASM
  has_ancestry
  geocoded_by :locatin
  after_validation :geocode, :if => :locatin_changed?

  belongs_to :team
  belongs_to :user
  belongs_to :work
  belongs_to :customer, :optional => true
  belongs_to :parent, :class_name => "Task", foreign_key: 'parent_id', :optional => true

  belongs_to :requesting_team, :class_name => "Team", foreign_key: 'requesting_team_id'
  belongs_to :managing_team, :class_name  => "Team", foreign_key: 'managing_team_id'
  belongs_to :operating_team, :class_name => "Team", foreign_key: 'operating_team_id'
  
  has_many :photos, as: :photoable, dependent: :destroy 
  has_many :taskitems, dependent: :destroy 

  scope :team, -> (team) { where team: team }
  scope :aasm_state, -> (aasm_state) { where aasm_state: aasm_state }
  scope :latest, -> { order(start_date: :desc) }

  aasm do
    state :booked, :initial => true
    state :asked, :approved, :infoForRequest, :rejected, :assigned, :acknowledged, :infoForWork
    state :inProgress, :completed, :appraised, :cancelled

    event :ask  do
      transitions from:  [:booked, :infoForRequest], to: :asked
    end

    event :askRequestInfo do
      transitions from: [:asked, :approved, :infoForWork ], to: :infoForRequest
    end

    event :cancel do
      transitions from: [:booked, :inProgress], to: :cancelled
    end

    event :reject do
      transitions from: [:booked, :asked], to: :rejected
    end
 
    event :approve do
      transitions from:  [:asked], to: :approved
    end

    event :assign do
      transitions from: [:approved, :asked, :infoForWork], to: :assigned
    end

    event :askWorkInfo do
      transitions from: :assigned, to: :infoForWork
    end

    event :acknowledge do
      transitions from: :assigned, to: :acknowledged
    end

    event :start do
      transitions :from => [:booked, :assigned, :acknowledged], to: :inProgress 
    end

    event :complete do
      transitions :from => :inProgress, to: :completed
    end

    event :appraise do
      transitions :from => :completed, to: :appraised
    end    
  end

  def stage
    if (self.booked? or self.infoForRequest? ) then 
      "Open"
    elsif (self.asked? or self.approved? or self.infoForWork? ) then
      "Pending"
    elsif (self.assigned? or self.acknowledged? or self.inProgress? ) then
      "Working"
    else
      "Closed"
    end 
  end

end
