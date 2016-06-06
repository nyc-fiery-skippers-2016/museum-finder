desc "This task send a test email through puts"
task :monthly_email => :environment do
  puts "WORKS!!!!!!!!!!!!!"
  puts ENV["GMAIL_USERNAME"]
  puts ENV["GMAIL_PASSWORD"]
      NewsLetter.monthly_email.deliver_now
end