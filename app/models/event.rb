class Event < ActiveRecord::Base
  def self.hosted_at(org_add)
    where("location ILIKE ?", "%#{org_add}%")
  end
end
