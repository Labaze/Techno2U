namespace :resident_advisor do
  desc "TODO"
  task scrapping: :environment do
    puts "Je scrappe"
    ScrappingResidentAdvisorJob.perform_later
  end

end
