Docker Backup to NIFTY Cloud Storage
===================

see NIFTY Cloud Storage : http://cloud.nifty.com/storage/

Docker container that periodically backups files to NIFTY Cloud Storage using [s3cmd sync](http://s3tools.org/s3cmd-sync) and cron.

### Usage

	docker run -d [OPTIONS] ysaotome/backup-to-niftycloud

### Parameters:

* `-e ACCESS_KEY=<NIFTY_Cloud_KEY>`: Your NIFTY Cloud Access key.
* `-e SECRET_KEY=<NIFTY_Cloud_SECRET>`: Your NIFTY Cloud Secret.
* `-e S3_PATH=s3://<BUCKET_NAME>/<PATH>/`: NIFTY Cloud Storage Bucket name and path. Should end with trailing slash. 
* `-v /path/to/backup:/data:ro`: mount target local folder to container's data folder.

### Optional parameters:

* `-e DATA_PATH=/data/`: container's data folder. Default is `/data/`. Should end with trailing slash.
* `-e 'CRON_SCHEDULE=0 1 * * *'`: specifies when cron job starts ([details](http://en.wikipedia.org/wiki/Cron)). Default is `0 1 * * *` (runs every day at 1:00 am). 

### Example:
    docker run -d \
    --name=backup-to-niftycloud \
    --restart=always \
    -e ACCESS_KEY=fakeawskey \
    -e SECRET_KEY=fakeawssecret \
    -e S3_PATH=s3://my-buckup/backup/ \
    -e 'CRON_SCHEDULE=*/10 * * * *' \
    -v /media/datastore:/data:ro \
    ysaotome/backup-to-niftycloud

