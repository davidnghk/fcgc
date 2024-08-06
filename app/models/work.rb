class Work < ApplicationRecord
  belongs_to :team
  belongs_to :workflow

  has_many :workitems, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def to_label
    if (I18n.locale == :zh) then 
      "#{local_name}"
    else 
      "#{name}"
    end  
  end

  def count_child
    Workitem.where(:work_id => self.id).count
  end

  def display_name
    if (I18n.locale == :zh) then 
      "#{local_name}"
    else 
      "#{name}"
    end 
  end
end
