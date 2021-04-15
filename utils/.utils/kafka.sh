#!/bin/bash

kafkaConsumer="$HOME/Downloads/kafka_2.13-2.7.0/bin/kafka-console-consumer.sh"
kafkaTopic="$HOME/Downloads/kafka_2.13-2.7.0/bin/kafka-topics.sh"

function kafka_consume() {
    $kafkaConsumer --bootstrap-server localhost:19092 --topic $1
}

function kafka_describe_topic() {
    $kafkaTopic --bootstrap-server localhost:19092 --topic $1 --describe 
}

function kafka_list_topics() {
    $kafkaTopic --bootstrap-server localhost:19092 --list
}



