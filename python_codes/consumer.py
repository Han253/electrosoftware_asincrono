#Importando librerías a usar
import pika
import sys, os

#AMQP Parameters
AMQP_BROKER = "localhost"
AMQP_QUEUE = "test"
AMQP_USER = "admin"
AMQP_PASS = "1234"

#Init AMQP connection data process
def consumer():
    credentials = pika.PlainCredentials(username=AMQP_USER,password=AMQP_PASS)
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=AMQP_BROKER,credentials=credentials))
    channel = connection.channel()
    channel.queue_declare(queue=AMQP_QUEUE)

    #Se llama cuando llega un mensaje
    def callback(ch, method, properties, body):
        #Call monitor process
        print(body.decode())
        
    channel.basic_consume(queue=AMQP_QUEUE, on_message_callback=callback, auto_ack=True)

    print(' [*] Waiting for messages. To exit press CTRL+C')
    channel.start_consuming()


#Main Process
def main():
    consumer()

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)