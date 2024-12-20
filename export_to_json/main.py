import boto3

def export_to_json(bucket_name, file_name, data):
    s3 = boto3.client('s3')
    with open(file_name, 'w') as file:
        file.write(data)
    s3.upload_file(file_name, bucket_name, file_name)
    print(f"File {file_name} uploaded to bucket {bucket_name}.")
