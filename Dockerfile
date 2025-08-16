FROM mcr.microsoft.com/azure-functions/python:4-python3.11

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

RUN apt-get update && apt-get install -y poppler-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /home/site/wwwroot

RUN pip install -r /home/site/wwwroot/requirements.txt --target /home/site/wwwroot
