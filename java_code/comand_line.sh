#--------------------------------------------------------------------------#
#DIRECTORIO KAFKA CLI CONTENEDOR
/opt/bitnami/kafka/bin

#--------------------------------------------------------------------------#
#COMANDOS PARA GESTIÓN DE TÓPICOS. 

#COMANDO PARA LISTAR TÓPICOS
kafka-topics.sh --bootstrap-server localhost:9092 --list

#COMANDO PARA CREAR TÓPICOS
kafka-topics.sh --bootstrap-server localhost:9092 --create --topic primer_topico --partitions 2

#COMANDO PARA DESCRIBIR UN TÓPICO
kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic primer_topico

#--------------------------------------------------------------------------#
#COMANDOS PARA PRODUCER CLI. 

#PRODUCIR MENSAJES
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic

#PRODUCIR MENSAJES CLAVE:VALOR
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic primer_topico --property parse.key=true --prrty key.separator=:

#--------------------------------------------------------------------------#
#COMANDOS PARA CONSUMER CLI. 

#COMANDO PARA INICIAR EL CONSUMER CLI
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic primer_topico

#LEER TODO EL HISTORIAL DE UN TÓPICO
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic primer_topico --from-beginning

#LEER TODO EL HISTORIAL Y MOSTRAR ADEMÁS CLAVE, VALOR, TIMESTAMP
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic primer_topico --from-beginning --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true

#GRUPO DE CONSUMIDORES
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic primer_topico --group uno
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic primer_topico --group dos


#--------------------------------------------------------------------------#
#COMANDOS PARA CONSUMER GROUPS CLI. 

#LISTA GRUPOS DE CONSUMIDORES
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

#DESCRIBIR UN GRUPO DE CONSUMIDORES
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group grupo-consumidores

#ELIMINAR UN GRUPO DE CONSUMIDORES
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group my-first-consumer-group

#REINICIAR OFFSETS DE GRUPO DE CONSUMIDORES
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group uno --reset-offsets --to-earliest --execute --all-
topics

