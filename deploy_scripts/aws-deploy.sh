#!/bin/bash

# AWS Deployment Script
LAMBDA_FUNCTION_NAME="ExportToJsonFunction"
S3_BUCKET_NAME="earthquaker-bucket"
ROLE_ARN="arn:aws:iam::your-account-id:role/your-lambda-role"

# Package and Deploy Lambda Function
zip -r function.zip export_to_json/*.py

aws s3 cp function.zip s3://$S3_BUCKET_NAME/

aws lambda create-function \
  --function-name $LAMBDA_FUNCTION_NAME \
  --runtime python3.8 \
  --role $ROLE_ARN \
  --handler main.handler \
  --code S3Bucket=$S3_BUCKET_NAME,S3Key=function.zip
