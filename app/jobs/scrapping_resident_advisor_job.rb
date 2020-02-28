class ScrappingResidentAdvisorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ResidentAdvisor.scrapping_parties("berlin", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("fr/paris", "week", Time.now.strftime("%Y-%d-%m"))
    ResidentAdvisor.scrapping_parties("uk/london", "week", Time.now.strftime("%Y-%d-%m"))
    ResidentAdvisor.scrapping_parties("it/rome", "week", Time.now.strftime("%Y-%d-%m"))
    ResidentAdvisor.scrapping_parties("nl/amsterdam", "week", Time.now.strftime("%Y-%d-%m"))
    ResidentAdvisor.scrapping_parties("us/newyork", "week", Time.now.strftime("%Y-%d-%m"))
    ResidentAdvisor.scrapping_parties("jp/tokyo", "week", Time.now.strftime("%Y-%d-%m"))
  end
end
