PROJECT=$(gcloud config list project --format "value(core.project)")
gsutil mb gs://$PROJECT
mvn compile exec:java -Dexec.mainClass=org.lcl.ingestion.Replication \
     -Dexec.args="--project=$PROJECT \
                  --gcpTempLocation=gs://$PROJECT/tmp"
     -Pdataflow-runner

