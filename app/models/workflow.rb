class Workflow < ApplicationRecord
	has_many :works, dependent: :destroy

  def to_label
    if (I18n.locale == :zh) then 
      "#{local_name}"
    else 
      "#{name}"
    end  
  end

  def display_name
    if (I18n.locale == :zh) then 
      "#{local_name}"
    else 
      "#{name}"
    end 
  end

end
