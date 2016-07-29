class SearchController < ApplicationController
  
  LESSTHAN25 = "1"
  LESSTHAN50 = "2"
  GREATERTHAN50 = "3"
  
  # The organization_display.jsx react component sends an ajax request with the appropriate parameters
  def search
    unless params[:term].empty?
      term = Organization.published.where('name ILIKE ? OR overview ILIKE ?', "%#{params[:term]}%", "%#{params[:term]}%").flatten
    else
      term = nil
    end
    
    if params[:size] == "0"
      size = nil
    elsif params[:size] == LESSTHAN25
      size = Organization.published.where(tech_team_size: 1..25)
    elsif params[:size] == LESSTHAN50
      size = Organization.published.where(tech_team_size: 26..50)
    elsif params[:size] == GREATERTHAN50
      size = Organization.published.where('tech_team_size > ?', 50)
    else
      flash[:alert] = "Invalid search!"
    end

    unless params[:tech].empty?
      techs = []
      # This gets the ids of the specified techs
      techs = params[:tech].split('+').map{|x| x.to_i}
      org_ids = OrganizationTechnology.where(technology_id: techs).pluck('organization_id').uniq
      techs = []
      org_ids.each do |o|
        techs.concat(Organization.published.where(id: o))
      end
      techs.flatten!
    end

    
    # Elements are nil if no search was executed in the respective category
    # This then gets the intersection of non-nil search results
    @results = [term, size, techs].keep_if{|x| x}.reduce(:&)

    # When deleting search options the search controller still receives an ajax request with no queries, hence the line below
    @results = Organization.all if @results.nil?

    render json: @results
  end
end
