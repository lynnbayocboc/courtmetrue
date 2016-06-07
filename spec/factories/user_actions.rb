FactoryGirl.define do
  factory :user_action do
    from_user_id 1
    to_user_id 1
    has_block false
    has_report_spam false
  end
end
