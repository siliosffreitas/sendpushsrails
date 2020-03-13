
SERVER_KEY = 
#"AAAAVrlwM0E:APA91bEZvmwa5WryWHcOalb6wchxFpwimlmOoMymySufgJR7PdRQM7h-JuhOrM3c6qrBC1AojJHiIOzVVXf-ZxL9NcNlJrdgVsP074g8v4vA_eH3PMTsZ6uQI_1FAZNsQLoPiUPfLeUG"
'AAAAl-sfvJo:APA91bHGPaiZ9VDr54cVOkiah-UX_bWdf5fDxhEqSq44G_Jp4CE8clq9O-BqWwTj03XlYchfrOO8BnJKSjoWtB55xCKDaaqC98ReVgXBa88c2Z5Z5WMYr5FK3GVmmy5lYLxaNTuVaqou'

# exemplo de chamada
# $ rails notificar:clientes["Nova guia disponível para regulação","Guia 2309 • IPE Saúde","dOZCjaSS0pk:APA91bEPh0ri_EXybjEjGi0mxdLWx29_SISAX0TWfn-SAN2FKDQN-aqnPN8qMs8cfMa1xv7Ubh1Gt2aqj6VEbdrWH33EzMXE3pisCicf5PZT6GUNSUNnd2jvftC2inAU5PeeCOinlxHJ ccMEvpJhlEU:APA91bHkUeOYzoduzT-IvqxMZurw2AxKmfYiC-UHTji8Ycv6_w0Yt0QrBhMLD7b8AWxqdLxoeCM1p9gTfMncwBRdEggbNW46T2xeYbF3NF_BhOIgJP_-L4FzpwC1rsjT_HtbaDUYNFof"]

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