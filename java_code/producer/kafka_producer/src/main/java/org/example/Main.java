package org.example;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        ProducerDemo producer = new ProducerDemo();
        producer.SendData("Hola mundo desde Java");
    }
}