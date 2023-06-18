#!/bin/bash

# Variables
sourceStorageAccountName="ksstrg1"
sourceStorageAccountKey="QMhjmRmKawyItBk/uoszhuvzENaBtt21gfOLUKCARmGN3bWxEntWsAsQMOOTanG+ZsHy3FYi4CrI+ASt4iiWag=="
sourceContainerName="ksstrg1container"

destinationStorageAccountName="ksstrg2"
destinationStorageAccountKey="dqmFRHVmqil7wJ9Bpv7EvUhsc6+pw4ygjWLnnOJeRETWAE1yKCBYfILDjQfBMzAEB8m9/4fA3YgB+AStrOPK5g=="
destinationContainerName="ksstrg2container"

# Create 100 blobs in source container
for ((i=1; i<=100; i++))
do

                blobName="blob$i.txt"
                        echo "Creating blob: $blobName"
                                echo "This is blob $i" > $blobName

                                az storage blob upload \
                                            --file $blobName \
                                                --container-name $sourceContainerName \
                                                    --account-name $sourceStorageAccountName \
                                                        --account-key $sourceStorageAccountKey \
                                                            --overwrite
                                                    done

                                                    # Copy blobs from source container to destination container

                                                    sudo azcopy copy \
'https://ksstrg1.blob.core.windows.net/ksstrg1container?sp=racwdli&st=2023-06-15T08:48:41Z&se=2023-06-15T16:48:41Z&spr=https&sv=2022-11-02&sr=c&sig=6kRQP5HP%2BUBXgqTnvUbXxspDjUy%2FPaJr8SI5b2tpKec%3D' \
                                                      'https://ksstrg2.blob.core.windows.net/ksstrg2container?sp=racwdli&st=2023-06-15T08:50:58Z&se=2023-06-15T16:50:58Z&spr=https&sv=2022-11-02&sr=c&sig=ymVJo0QqcWjwhkVLmSASw8OBoGnKNRfIvHmI%2BCL0oXo%3D' \
                                                            --recursive