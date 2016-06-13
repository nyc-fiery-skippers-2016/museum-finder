desc "This task sends a monthly newsletter"

task :monthly_email => :environment do
 if [ "$(date +%d)" = 01 ];
   NewsLetter.monthly_email.deliver_now
 end
end