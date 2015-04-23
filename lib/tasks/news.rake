namespace :news do
  desc "Populates Articles from USAToday"
  task :get_top => [:environment] do
    Article.destroy_all
    Article.get_topnews
    puts "Generated #{Article.count} Articles."
  end
end
