.class public Lcom/your_class/ZipExtractor;
.super Ljava/lang/Object;

.method public static extractZip(Landroid/content/Context;)V
    .registers 13
    .param p0, "context"  # Landroid/content/Context;

    const-string v0, "assetpacks.zip"

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;
    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    move-result-object v2

    new-instance v3, Ljava/util/zip/ZipInputStream;
    invoke-direct {v3, v2}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

:next_entry
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    move-result-object v4

    if-eqz v4, :end_zip

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;
    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;
    move-result-object v6

    new-instance v7, Ljava/io/File;
    invoke-direct {v7, v6, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->isDirectory()Z
    move-result v8

    if-eqz v8, :write_file

    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z
    goto :next_entry

:write_file
    new-instance v8, Ljava/io/FileOutputStream;
    invoke-direct {v8, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/16 v9, 0x400
    new-array v9, v9, [B

:read_loop
    invoke-virtual {v3, v9}, Ljava/util/zip/ZipInputStream;->read([B)I
    move-result v10

    if-ltz v10, :close_file

    const/4 v11, 0x0
    invoke-virtual {v8, v9, v11, v10}, Ljava/io/FileOutputStream;->write([BII)V
    goto :read_loop

:close_file
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V
    goto :next_entry

:end_zip
    invoke-virtual {v3}, Ljava/util/zip/ZipInputStream;->close()V
    return-void
.end method