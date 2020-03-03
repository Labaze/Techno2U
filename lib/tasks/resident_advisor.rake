namespace :resident_advisor do
  desc "TODO"
  task scrapping: :environment do
    puts "Scrapping resident advisors parties"
    ScrappingResidentAdvisorJob.perform_later
  end

end
