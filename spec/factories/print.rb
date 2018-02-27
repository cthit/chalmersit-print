FactoryBot.define do

  factory :print do
    copies 100
    duplex true
    collate true
    ranges '3, 5-7'
    ppi 600
    media 'A3'
    grayscale true
    association :printer
  end
end
