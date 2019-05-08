namespace :notificar do
    desc ''
    task :cliente, [:devices] => [:environment] do |task, args|
        require 'fcm'
        puts "Iniciando envio dos pushs"
        fcm = FCM.new("AAAAVrlwM0E:APA91bEZvmwa5WryWHcOalb6wchxFpwimlmOoMymySufgJR7PdRQM7h-JuhOrM3c6qrBC1AojJHiIOzVVXf-ZxL9NcNlJrdgVsP074g8v4vA_eH3PMTsZ6uQI_1FAZNsQLoPiUPfLeUG")
        # you can set option parameters in here
        #  - all options are pass to HTTParty method arguments
        #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
        #  fcm = FCM.new("my_server_key", timeout: 3)

        registration_ids = args[:devices].split(" ")
        
        #["dOZCjaSS0pk:APA91bEPh0ri_EXybjEjGi0mxdLWx29_SISAX0TWfn-SAN2FKDQN-aqnPN8qMs8cfMa1xv7Ubh1Gt2aqj6VEbdrWH33EzMXE3pisCicf5PZT6GUNSUNnd2jvftC2inAU5PeeCOinlxHJ"] # an array of one or more client registration tokens

        # See https://firebase.google.com/docs/reference/fcm/rest/v1/projects.messages for all available options.
        options = { "notification": {
                    "title": "Portugal vs. Denmark",
                    "body": "5 to 1"
                }
        }
        response = fcm.send(registration_ids, options)
        puts response
        
        puts "Finalizando envio dos pushs"
    end
end