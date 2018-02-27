FactoryBot.define do

  factory :printer do
    name "printer_name"
    location  "In the cloud"
    weight 10
    duplex true
    deleted false
  end
end
