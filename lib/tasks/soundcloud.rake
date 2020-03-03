namespace :soundcloud do
  desc "TODO"
  task scrapping: :environment do
    puts "Scrapping artists tracks"
    ScrappingSoundcloudJob.perform_later
  end

end
