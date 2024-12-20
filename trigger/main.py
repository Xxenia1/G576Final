import boto3
import json

def lambda_handler(event, context):
    for record in event['Records']:
        body = json.loads(record['body'])
        process_message(body)

def process_message(message):
    print(f"Processing message: {message}")
