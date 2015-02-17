FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
    admin true
    enabled true
  end

  factory :user2, class: User do
    username "Uolevi"
    password "Foobar2"
    password_confirmation "Foobar2"
    admin true
    enabled true
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 20
  end

  factory :realrating, class: Rating do
    user
    beer
    score 5
  end

  factory :brewery do
    name "anonymous"
    year 1900
    active true
  end

  factory :style do
    name "IPA"
    desc "IPA Beer"
  end

  factory :beer do
    name "anonymous"
    brewery
    style
  end

end