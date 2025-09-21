# ZipExtractor
a small test for zip Extraction in /data/data/packpagename/files

# USAGE:
do the baksmali in classes.dex, find the main or satisfying activity and add this line in method OnCreate: invoke-static {p0}, Lcom//yourclass/ZipExtractor;->extractZip(Landroid/content/Context;)V

at these points with L/com/yourclass replace with the path of the activity you will use for example: Lcom/android/aplication > this would be the path of the Main Activity or another


When packaging a zip file, organize it like this. 
```
assetpacks.zip 
|————assetpacks/ 
  |---------pack1/ | 
           |---- file1.dat
           |----file2.dat 
  |———— pack2/ │ 
       |------fileA.dat 
       |------fileB.dat 
  |----------config.json 
```  
**Wrong structure**
```
assetpacks.zip 
|———————files/ 
 |——————assetpacks/ 
  |———— pack1/ 
           |---- file1.dat
           |----file2.dat 
  |———— pack2/
       |------fileA.dat 
       |------fileB.dat 
  |----------config.json 
  ``` 
   In this example I gave, I used assetpack extraction. Instead of zipping the files/assetpacks folder, I used smali to understand that the correct structure is zipping the contents of the files/ folder. That is, you would only zip the assetpacks folder.
   
Tip: the line: const-string v0, "assetpacks.zip", can be changed to any zip file name

# PURPOSE
I built it in smali because of the ease of people being able to add this class to assist in any file extraction to the indicated directory, it is practical for extracting assetpacks or anything
