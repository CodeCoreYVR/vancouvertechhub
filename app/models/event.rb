class Event < ActiveRecord::Base

  validates :meetup_url, uniqueness: true
  
  def self.hosted_at(org_add)
    where("location ILIKE ?", "%#{org_add}%")
  end


end
