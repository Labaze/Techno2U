class ScrappingResidentAdvisorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # ResidentAdvisor.scrapping_parties("berlin", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("fr/paris", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("uk/london", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("it/rome", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("nl/amsterdam", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("us/newyork", "week", Time.now.strftime("%Y-%d-%m"))
    # ResidentAdvisor.scrapping_parties("jp/tokyo", "week", Time.now.strftime("%Y-%d-%m"))
    today = Time.now.strftime("%Y-%m-%d")
    ResidentAdvisor.scrapping_parties("de", "berlin",    "week", today)
    ResidentAdvisor.scrapping_parties("fr", "paris",     "week", today)
    ResidentAdvisor.scrapping_parties("fr", "north",     "month", today)
    ResidentAdvisor.scrapping_parties("uk", "london",    "week", today)
    ResidentAdvisor.scrapping_parties("it", "rome",      "week", today)
    ResidentAdvisor.scrapping_parties("nl", "amsterdam", "week", today)
    ResidentAdvisor.scrapping_parties("us", "newyork",   "week", today)
    ResidentAdvisor.scrapping_parties("jp", "tokyo",     "week", today)
  end
end
