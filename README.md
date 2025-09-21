# ZipExtractor
a small test for zip Extraction in /data/data/packpagename/files

#USAGE:
do the baksmali in classes.dex, find the main or satisfying activity and add this line in method OnCreate: invoke-static {p0}, Lcom//yourclass/ZipExtractor;->extractZip(Landroid/content/Context;)V

at these points with L/com/yourclass replace with the path of the activity you will use for example: Lcom/android/aplication > this would be the path of the Main Activity or another
