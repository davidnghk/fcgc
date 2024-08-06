class DashboardController < ApplicationController
  def show
  	@tasks = current_team.tasks.where('created_at > ? ', Date.today.beginning_of_month - 3.months)
  	@documents = current_team.documents.where('created_at > ? ', Date.today.beginning_of_month - 12.months)
  end
end
