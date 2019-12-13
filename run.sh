PROJECT=$(gcloud config list project --format "value(core.project)")
gsutil mb gs://$PROJECT
mvn compile exec:java -Dexec.mainClass=org.lcl.beam.ingestion.Replication \
     -Dexec.args="--runner=DataflowRunner --project=$PROJECT \
                  --gcpTempLocation=gs://$PROJECT/tmp \
                  --inputFile=gs://apache-beam-samples/shakespeare/* --output=gs://$PROJECT/counts" \
     -Pdataflow-runner

