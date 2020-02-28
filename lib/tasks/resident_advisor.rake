namespace :resident_advisor do
  desc "TODO"
  task scrapping: :environment do
    puts "Scrapping"
    ScrappingResidentAdvisorJob.perform_later
  end

end
