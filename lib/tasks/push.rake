
SERVER_KEY = 
'SERVER_KEY_FIREBASE'

# exemplo de chamada
# $ rails notificar:clientes["Título","Texto","deviceId1 deviceId2"]

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