#Importando librerías a usar
import pika
import sys, os


#AMQP Parameters
AMQP_BROKER = "localhost"
AMQP_QUEUE = "test"
AMQP_ROUTING_KEY = "test"
AMQP_USER = "admin"
AMQP_PASS = "1234"
ROUTING_KEY = "cocina.temperatura"


def producer(message):
    credentials = pika.PlainCredentials(username=AMQP_USER,password=AMQP_PASS)
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=AMQP_BROKER,credentials=credentials))
    channel = connection.channel()
    channel.exchange_declare(exchange='topic_logs', exchange_type='topic')
    channel.basic_publish(exchange='topic_logs', routing_key=ROUTING_KEY, body=message)
    print(" [X] Send data -- %s" % message)
    connection.close()

#Main Process
def main():
    producer("AMQP Hola Mundo")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)