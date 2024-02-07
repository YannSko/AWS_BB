#!/bin/bash

# Install necessary dependencies
sudo apt-get update
sudo apt-get install python3-pip -y
pip3 install numpy pandas scikit-learn tensorflow

# Transfer data to EC2 instance (replace <local_path> and <remote_path> with actual paths)
aws s3 cp s3://your_bucket/data/ <local_path> <remote_path>

# Run training script
python3 train.py --data <remote_path>/training_data.csv --model <remote_path>/saved_model

# Optionally, you can copy the trained model back to S3 or wherever you need it
aws s3 cp <remote_path>/saved_model s3://your_bucket/models/