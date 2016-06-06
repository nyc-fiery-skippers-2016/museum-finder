desc "This task send a test email through puts"
task :monthly_email => :environment do
  puts "WORKS!!!!!!!!!!!!!"
    User.find_each do |user|
      NewsLetter.monthly_email.deliver_now
    end
end