# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# ["Front-end","Back-end","iOS","Android","Project Management"].each do |cat|
#   Category.create(name: cat)
# end
#
# ["Ruby","Rails","SQL","PHP","Python","Javascript","jQuery","AJAX","HTML","CSS","Swift","XCode"].each do |skill|
#   Skill.create(name: skill,
#                category_id: Category.all.sample.id)
# end
#
# 10.times do
#   Project.create(title:        Faker::Company.name,
#                  description:  Faker::Hipster.paragraph,
#                  project_url:  Faker::Internet.url,
#                  github_url:   Faker::Internet.url('github.com'))
# end
#
# 20.times do
#   user = User.create(first_name: Faker::Name.first_name,
#                      last_name:  Faker::Name.last_name,
#                      email:      Faker::Internet.email,
#                      password:   "testingpassword",
#                      password_confirmation: "testingpassword")
#   profile = Profile.create(user_id:      user.id,
#                            tagline:      Faker::Hipster.sentences(1),
#                            description:  Faker::Hipster.paragraph,
#                            availability: [true,false].sample)
#   4.times do
#     Skillset.create(profile_id: profile.id,
#                     skill_id: Skill.all.sample.id,
#                     proficiency: (1..10).to_a.sample)
#   end
# end
#
# 2.times do
#   Profile.all.each do |profile|
#     Membership.create(profile_id: profile.id,
#                       project_id: (1..10).to_a.sample)
#   end
# end

Profile.all.each do |profile|
  2.times do
  Experience.create(profile_id:   profile.id,
                    job_title:    Faker::Company.profession,
                    company_name: Faker::Company.name,
                    description:  Faker::Hipster.paragraph,
                    company_url:  Faker::Internet.url,
                    from_date:    Faker::Date.between(5.years.ago, 4.years.ago),
                    to_date:      Faker::Date.between(4.years.ago, 2.years.ago))

  Education.create(profile_id:  profile.id,
                   school:      Faker::University.name,
                   degree:      Faker::Company.bs,
                   description: Faker::Hipster.paragraph,
                   school_url:  Faker::Internet.url)
  end
end

# Skillset.create(profile_id: 23, skill_id: Skill.all.sample.id, proficiency: (1..10).to_a.sample)
