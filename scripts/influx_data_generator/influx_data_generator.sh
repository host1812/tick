while true
do
    value=$(shuf -i 1000-2000 -n 1)
    curl -u monitor:monitor -k -i -XPOST 'http://localhost:8086/write?db=remote_metrics' \
        --data-binary "sqs,queue_name=nlptest,host=tick-simple queue_messages=${value}"
    sleep 1
done
