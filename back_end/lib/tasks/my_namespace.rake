namespace :my_namespace do
  desc "Rake task to update materialized view"
  task fetch: :environment do
    puts "updating view"
    MatchReports.refresh
    puts "Success!"
  end
end
