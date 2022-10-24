package org.example;

import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;


public class ProducerDemo {

    private Properties properties;

    //Constructor de clase
    public ProducerDemo(){
        //Producer Properties
        properties = new Properties();
        properties.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "0.0.0.0:9092");
        properties.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        properties.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());

    }

    public void SendData(String value){
        //Create the Producer
        KafkaProducer<String,String> producer = new KafkaProducer<>(properties);
        //Topico, Particion, Key, Value
        ProducerRecord<String,String> producerRecord =
                new ProducerRecord<>("test_java", value);
        //Send Data Asynchronous
        producer.send(producerRecord);

        //flush data -synchronous
        producer.flush();

        //Close Producer
        producer.close();

    }

}
