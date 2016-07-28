FactoryGirl.define do
  factory :event do
    meetup_title "MyString"
    meetup_url "MyString"
    location "MyString"
    start_time Time.now + 10.days
  end
end
