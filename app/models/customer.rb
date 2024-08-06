class Customer < ApplicationRecord
  belongs_to :team
  
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
