#Path in which files will be created
$PATH = "D:/"
$FILE_PATH = $PATH + "/files"
$BACKUP_PATH = $PATH + "/backup"
$FOLDERS_LIST = "week" , "month" , "daily"
# Setting location to move to the desired directory
Set-Location $PATH
# Check if file already Exists
if ((Test-Path $FILE_PATH) -And (Test-Path $BACKUP_PATH)) {
    ## If folders exist the simply zip the content and copy them to the backupfolder
    Compress-Archive -Path D:\files\*.* -DestinationPath D:\backup\daily\backup.zip
}
else {
    # create the file if it is non-existent already
    mkdir $FILE_PATH
    mkdir $BACKUP_PATH

    # move to the backupfolder and create backup folders
    Set-Location $BACKUP_PATH

    #creating the backup folders
    for ($i = 0; $i -le ($FOLDERS_LIST.length - 1); $i += 1) {
        mkdir $FOLDERS_LIST[$i]
    }

}