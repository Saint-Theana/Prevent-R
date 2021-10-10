.class public Lcom/android/server/am/PreventRunning;
.super Ljava/lang/Object;
.source "PreventRunning.java"

# interfaces
.implements Lcom/android/server/am/PreventRunningHook;


# static fields
.field private static APKS:[Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "Prevent"

.field public static final VERSION:I = 0x133a200


# instance fields
.field private mPreventRunning:Lcom/android/server/am/PreventRunningHook;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 18
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-1/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-2/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-3/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-1.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-2.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "/data/app/me.piebridge.prevent-3.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "/system/app/Brevent.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "/system/app/Brevent/Brevent.apk"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/server/am/PreventRunning;->APKS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 7

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    sget-object v3, Lcom/android/server/am/PreventRunning;->APKS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v4, :cond_19

    aget-object v0, v3, v2

    .line 25
    .local v0, "file":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 26
    .local v1, "file2":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 27
    invoke-direct {p0, v1}, Lcom/android/server/am/PreventRunning;->initPreventRunning(Ljava/io/File;)Z

    .line 31
    .end local v0  # "file":Ljava/lang/String;
    .end local v1  # "file2":Ljava/io/File;
    :cond_19
    return-void

    .line 24
    .restart local v0  # "file":Ljava/lang/String;
    .restart local v1  # "file2":Ljava/io/File;
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method private initPreventRunning(Ljava/io/File;)Z
    .registers 12
    .param p1, "file"  # Ljava/io/File;

    .prologue
    const/4 v6, 0x0

    .line 35
    :try_start_1
    new-instance v0, Ldalvik/system/DexClassLoader;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "/cache"

    const/4 v5, 0x0

    check-cast v5, Ljava/lang/String;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    invoke-direct {v0, v7, v8, v5, v9}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 36
    .local v0, "dexClassLoader":Ldalvik/system/DexClassLoader;
    const-string/jumbo v5, "Prevent"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "loading PreventRunning(20161024) from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    const-string/jumbo v5, "me.piebridge.prevent.framework.PreventRunning"

    invoke-virtual {v0, v5}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/am/PreventRunningHook;

    iput-object v5, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    .line 38
    const v5, 0x133a200

    invoke-virtual {p0, v5}, Lcom/android/server/am/PreventRunning;->setVersion(I)V

    .line 39
    const-string/jumbo v5, "native"

    invoke-virtual {p0, v5}, Lcom/android/server/am/PreventRunning;->setMethod(Ljava/lang/String;)V
    :try_end_4d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4d} :catch_4f
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_4d} :catch_5b
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_4d} :catch_67
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_4d} :catch_73

    .line 40
    const/4 v5, 0x1

    .line 52
    .end local v0  # "dexClassLoader":Ldalvik/system/DexClassLoader;
    :goto_4e
    return v5

    .line 41
    :catch_4f
    move-exception v1

    .line 42
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string/jumbo v5, "Prevent"

    const-string/jumbo v7, "cannot find class"

    invoke-static {v5, v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v6

    .line 43
    goto :goto_4e

    .line 44
    .end local v1  # "e":Ljava/lang/ClassNotFoundException;
    :catch_5b
    move-exception v2

    .line 45
    .local v2, "e2":Ljava/lang/InstantiationException;
    const-string/jumbo v5, "Prevent"

    const-string/jumbo v7, "cannot instance class"

    invoke-static {v5, v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v6

    .line 46
    goto :goto_4e

    .line 47
    .end local v2  # "e2":Ljava/lang/InstantiationException;
    :catch_67
    move-exception v3

    .line 48
    .local v3, "e3":Ljava/lang/IllegalAccessException;
    const-string/jumbo v5, "Prevent"

    const-string/jumbo v7, "cannot access class"

    invoke-static {v5, v7, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v6

    .line 49
    goto :goto_4e

    .line 50
    .end local v3  # "e3":Ljava/lang/IllegalAccessException;
    :catch_73
    move-exception v4

    .line 51
    .local v4, "th":Ljava/lang/Throwable;
    const-string/jumbo v5, "Prevent"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "cannot load PreventRunning from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v5, v6

    .line 52
    goto :goto_4e
.end method


# virtual methods
.method public hookBindService(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"  # Landroid/content/Intent;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->hookBindService(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z
    .registers 6
    .param p1, "context"  # Landroid/content/Context;
    .param p2, "applicationInfo"  # Landroid/content/pm/ApplicationInfo;
    .param p3, "str"  # Ljava/lang/String;
    .param p4, "componentName"  # Landroid/content/ComponentName;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/server/am/PreventRunningHook;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hookStartService(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"  # Landroid/content/Intent;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->hookStartService(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isActiviated()Z
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isExcludingStopped(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I
    .registers 16
    .param p1, "i"  # I
    .param p2, "obj"  # Ljava/lang/Object;
    .param p3, "str"  # Ljava/lang/String;
    .param p4, "str2"  # Ljava/lang/String;
    .param p5, "str3"  # Ljava/lang/String;
    .param p6, "uri"  # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 125
    .local p7, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_11

    .line 126
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    invoke-interface/range {v0 .. v7}, Lcom/android/server/am/PreventRunningHook;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result p1

    .line 128
    .end local p1  # "i":I
    :cond_11
    return p1
.end method

.method public onActivityAbandonAudioFocus(IILjava/lang/String;)V
    .registers 5
    .param p1, "uid"  # I
    .param p2, "pid"  # I
    .param p3, "clientId"  # Ljava/lang/String;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 147
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/server/am/PreventRunningHook;->onActivityAbandonAudioFocus(IILjava/lang/String;)V

    .line 149
    :cond_9
    return-void
.end method

.method public onActivityEstablishVpnConnection(Ljava/lang/String;)V
    .registers 3
    .param p1, "packageName"  # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 161
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onActivityEstablishVpnConnection(Ljava/lang/String;)V

    .line 163
    :cond_9
    return-void
.end method

.method public onActivityLostAudioFocusOnDeath(Ljava/lang/String;)V
    .registers 3
    .param p1, "clientId"  # Ljava/lang/String;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 154
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onActivityLostAudioFocusOnDeath(Ljava/lang/String;)V

    .line 156
    :cond_9
    return-void
.end method

.method public onActivityRequestAudioFocus(IILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "uid"  # I
    .param p2, "pid"  # I
    .param p3, "clientId"  # Ljava/lang/String;
    .param p4, "packageName"  # Ljava/lang/String;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 140
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/server/am/PreventRunningHook;->onActivityRequestAudioFocus(IILjava/lang/String;Ljava/lang/String;)V

    .line 142
    :cond_9
    return-void
.end method

.method public onAppDied(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"  # Ljava/lang/Object;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 88
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onAppDied(Ljava/lang/Object;)V

    .line 90
    :cond_9
    return-void
.end method

.method public onBroadcastIntent(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"  # Landroid/content/Intent;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 64
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onBroadcastIntent(Landroid/content/Intent;)V

    .line 66
    :cond_9
    return-void
.end method

.method public onCleanUpRemovedTask(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 70
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onCleanUpRemovedTask(Ljava/lang/String;)V

    .line 72
    :cond_9
    return-void
.end method

.method public onDestroyActivity(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"  # Ljava/lang/Object;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 112
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onDestroyActivity(Ljava/lang/Object;)V

    .line 114
    :cond_9
    return-void
.end method

.method public onLaunchActivity(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"  # Ljava/lang/Object;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 94
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onLaunchActivity(Ljava/lang/Object;)V

    .line 96
    :cond_9
    return-void
.end method

.method public onMoveActivityTaskToBack(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 82
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    .line 84
    :cond_9
    return-void
.end method

.method public onResumeActivity(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"  # Ljava/lang/Object;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 100
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onResumeActivity(Ljava/lang/Object;)V

    .line 102
    :cond_9
    return-void
.end method

.method public onStartHomeActivity(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 76
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onStartHomeActivity(Ljava/lang/String;)V

    .line 78
    :cond_9
    return-void
.end method

.method public onUserLeavingActivity(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"  # Ljava/lang/Object;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 106
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->onUserLeavingActivity(Ljava/lang/Object;)V

    .line 108
    :cond_9
    return-void
.end method

.method public onVpnConnectionDisconnected()V
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 168
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0}, Lcom/android/server/am/PreventRunningHook;->onVpnConnectionDisconnected()V

    .line 170
    :cond_9
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 175
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setMethod(Ljava/lang/String;)V

    .line 177
    :cond_9
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"  # Ljava/lang/String;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 58
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setSender(Ljava/lang/String;)V

    .line 60
    :cond_9
    return-void
.end method

.method public setVersion(I)V
    .registers 3
    .param p1, "i"  # I

    .prologue
    .line 132
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    if-eqz v0, :cond_9

    .line 133
    iget-object v0, p0, Lcom/android/server/am/PreventRunning;->mPreventRunning:Lcom/android/server/am/PreventRunningHook;

    invoke-interface {v0, p1}, Lcom/android/server/am/PreventRunningHook;->setVersion(I)V

    .line 135
    :cond_9
    return-void
.end method
