
SERVER_KEY = "AAAAVrlwM0E:APA91bEZvmwa5WryWHcOalb6wchxFpwimlmOoMymySufgJR7PdRQM7h-JuhOrM3c6qrBC1AojJHiIOzVVXf-ZxL9NcNlJrdgVsP074g8v4vA_eH3PMTsZ6uQI_1FAZNsQLoPiUPfLeUG"

# exemplo de chamada
# $ rails notificar:clientes["Nova guia disponível para regulação","Guia 2309 • IPE Saúde","dOZCjaSS0pk:APA91bEPh0ri_EXybjEjGi0mxdLWx29_SISAX0TWfn-SAN2FKDQN-aqnPN8qMs8cfMa1xv7Ubh1Gt2aqj6VEbdrWH33EzMXE3pisCicf5PZT6GUNSUNnd2jvftC2inAU5PeeCOinlxHJ dDT_qh0P59Y:APA91bFrUOUAUHdBXTv4jiozPDwbYoB9WSoCLcUiD6SQz_c82NOGJflOWWu-T17O80H8w_IJJHIYNkNj4bqDQFOZntwO1DM0lFrmPb9aopc-NGcg--C6jvE48BB5OmVs43lkLTRGLUHD"]

namespace :notificar do
    desc 'Envia pushs para os celulares, em "devices" é passado uma lista de deviceID do firebase separado por ESPACO'
    task :clientes, [:title, :body, :devices] => [:environment] do |task, args|
        require 'fcm'
        puts "Iniciando envio dos pushs"
        fcm = FCM.new(SERVER_KEY)
        
        registration_ids = args[:devices].split(" ")
        

        options = { 
            "notification": {
                "title": args[:title],
                "body": args[:body],
                "sound": "default",
                "badge": '1'
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