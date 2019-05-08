
SERVER_KEY = "AAAAVrlwM0E:APA91bEZvmwa5WryWHcOalb6wchxFpwimlmOoMymySufgJR7PdRQM7h-JuhOrM3c6qrBC1AojJHiIOzVVXf-ZxL9NcNlJrdgVsP074g8v4vA_eH3PMTsZ6uQI_1FAZNsQLoPiUPfLeUG"

namespace :notificar do
    desc 'Envia pushs para os celulares, em "devices" é passado uma lista de deviceID do firebase separado por ESPACO'
    task :clientes, [:devices] => [:environment] do |task, args|
        require 'fcm'
        puts "Iniciando envio dos pushs"
        fcm = FCM.new(SERVER_KEY)
        
        registration_ids = args[:devices].split(" ")
        

        options = { 
            "notification": {
                "title": "Nova guia disponível para regulação",
                "body": "Guia 2309 • IPE Saúde",
                "sound": "default",
                # "badge": '1'
            },
            # "data": {
            #     # "click_action": "FLUTTER_NOTIFICATION_CLICK",
            #     "sound": "default", 
            #     # "status": "done",
            #     # "screen": "screenA",
            # },
        }
        response = fcm.send(registration_ids, options)
        # puts response
        
        puts "Finalizando envio dos pushs"
    end
end