.class public Lcom/android/server/am/PreventRunningUtils;
.super Ljava/lang/Object;
.source "PreventRunningUtils.java"


# static fields
.field private static ams:Lcom/android/server/am/ActivityManagerService;

.field private static mPreventRunning:Lcom/android/server/am/PreventRunning;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    new-instance v0, Lcom/android/server/am/PreventRunning;

    invoke-direct {v0}, Lcom/android/server/am/PreventRunning;-><init>()V

    sput-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public static clearSender()V
    .registers 2

    .prologue
    .line 83
    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method private static forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;
    .registers 3
    .param p0, "iBinder"  # Landroid/os/IBinder;

    .prologue
    .line 137
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    .line 138
    invoke-static {p0}, Lcom/android/server/wm/ActivityRecord;->forTokenLocked(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v0

    .line 140
    :goto_a
    return-object v0

    :cond_b
    invoke-static {p0}, Lcom/android/server/wm/ActivityRecord;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v0

    goto :goto_a
.end method

.method private static getAms()Lcom/android/server/am/ActivityManagerService;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    if-nez v0, :cond_f

    .line 24
    const-string/jumbo v0, "activity"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ActivityManagerService;

    sput-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    .line 26
    :cond_f
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    return-object v0
.end method

.method public static hookBindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;)Z
    .registers 4
    .param p0, "iApplicationThread"  # Landroid/app/IApplicationThread;
    .param p1, "iBinder"  # Landroid/os/IBinder;
    .param p2, "intent"  # Landroid/content/Intent;

    .prologue
    .line 91
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p2}, Lcom/android/server/am/PreventRunning;->hookBindService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z
    .registers 8
    .param p0, "str"  # Ljava/lang/String;
    .param p1, "applicationInfo"  # Landroid/content/pm/ApplicationInfo;
    .param p2, "z"  # Z
    .param p3, "i"  # I
    .param p4, "str2"  # Ljava/lang/String;
    .param p5, "componentName"  # Landroid/content/ComponentName;

    .prologue
    .line 43
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v1

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p4, p5}, Lcom/android/server/am/PreventRunning;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    return v0
.end method

.method public static hookStartService(Landroid/app/IApplicationThread;Landroid/content/Intent;)Z
    .registers 3
    .param p0, "iApplicationThread"  # Landroid/app/IApplicationThread;
    .param p1, "intent"  # Landroid/content/Intent;

    .prologue
    .line 87
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p1}, Lcom/android/server/am/PreventRunning;->hookStartService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static isExcludingStopped(Landroid/content/Intent;)Z
    .registers 4
    .param p0, "intent"  # Landroid/content/Intent;

    .prologue
    .line 30
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Intent;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x30

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1a

    if-eqz v0, :cond_1a

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method public static match(Landroid/content/IntentFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I
    .registers 15
    .param p0, "intentFilter"  # Landroid/content/IntentFilter;
    .param p1, "str"  # Ljava/lang/String;
    .param p2, "str2"  # Ljava/lang/String;
    .param p3, "str3"  # Ljava/lang/String;
    .param p4, "uri"  # Landroid/net/Uri;
    .param p6, "str4"  # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/IntentFilter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 35
    .local p5, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p6}, Landroid/content/IntentFilter;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I

    move-result v1

    .line 36
    .local v1, "match":I
    if-ltz v1, :cond_12

    .line 37
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/am/PreventRunning;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result v1

    .line 39
    .end local v1  # "match":I
    :cond_12
    return v1
.end method

.method public static onActivityAbandonAudioFocus(IILjava/lang/String;)V
    .registers 4
    .param p0, "uid"  # I
    .param p1, "pid"  # I
    .param p2, "clientId"  # Ljava/lang/String;

    .prologue
    .line 116
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0, p1, p2}, Lcom/android/server/am/PreventRunning;->onActivityAbandonAudioFocus(IILjava/lang/String;)V

    .line 117
    return-void
.end method

.method public static onActivityEstablishVpnConnection(Ljava/lang/String;)V
    .registers 2
    .param p0, "packageName"  # Ljava/lang/String;

    .prologue
    .line 128
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onActivityEstablishVpnConnection(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public static onActivityLostAudioFocusOnDeath(Ljava/lang/String;)V
    .registers 2
    .param p0, "clientId"  # Ljava/lang/String;

    .prologue
    .line 120
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onActivityLostAudioFocusOnDeath(Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method public static onActivityRequestAudioFocus(IILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "uid"  # I
    .param p1, "pid"  # I
    .param p2, "clientId"  # Ljava/lang/String;
    .param p3, "packageName"  # Ljava/lang/String;

    .prologue
    .line 113
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/android/server/am/PreventRunning;->onActivityRequestAudioFocus(IILjava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public static onAppDied(Lcom/android/server/am/ProcessRecord;)V
    .registers 2
    .param p0, "processRecord"  # Lcom/android/server/am/ProcessRecord;

    .prologue
    .line 55
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onAppDied(Ljava/lang/Object;)V

    .line 56
    return-void
.end method

.method public static onBroadcastIntent(Landroid/content/Intent;)V
    .registers 2
    .param p0, "intent"  # Landroid/content/Intent;

    .prologue
    .line 95
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onBroadcastIntent(Landroid/content/Intent;)V

    .line 96
    return-void
.end method

.method public static onCleanUpRemovedTask(Landroid/content/Intent;)V
    .registers 3
    .param p0, "intent"  # Landroid/content/Intent;

    .prologue
    .line 67
    if-eqz p0, :cond_15

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 68
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onCleanUpRemovedTask(Ljava/lang/String;)V

    .line 70
    :cond_15
    return-void
.end method

.method public static onDestroyActivity(Landroid/os/IBinder;)V
    .registers 3
    .param p0, "iBinder"  # Landroid/os/IBinder;

    .prologue
    .line 109
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onDestroyActivity(Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method public static onLaunchActivity(Landroid/os/IBinder;)V
    .registers 3
    .param p0, "iBinder"  # Landroid/os/IBinder;

    .prologue
    .line 124
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onLaunchActivity(Ljava/lang/Object;)V

    .line 125
    return-void
.end method

.method public static onMoveActivityTaskToBack(Landroid/os/IBinder;)V
    .registers 4
    .param p0, "iBinder"  # Landroid/os/IBinder;

    .prologue
    .line 73
    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v0

    .line 74
    .local v0, "forToken":Lcom/android/server/wm/ActivityRecord;
    sget-object v2, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    if-eqz v0, :cond_e

    iget-object v1, v0, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    :goto_a
    invoke-virtual {v2, v1}, Lcom/android/server/am/PreventRunning;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    .line 75
    return-void

    .line 74
    :cond_e
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public static onResumeActivity(Landroid/os/IBinder;)V
    .registers 3
    .param p0, "iBinder"  # Landroid/os/IBinder;

    .prologue
    .line 105
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onResumeActivity(Ljava/lang/Object;)V

    .line 106
    return-void
.end method

.method public static onStartActivity(ILandroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;)I
    .registers 7
    .param p0, "i"  # I
    .param p1, "iApplicationThread"  # Landroid/app/IApplicationThread;
    .param p2, "str"  # Ljava/lang/String;
    .param p3, "intent"  # Landroid/content/Intent;

    .prologue
    .line 48
    if-ltz p0, :cond_29

    if-eqz p3, :cond_29

    const-string/jumbo v1, "android.intent.category.HOME"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_16

    const-string/jumbo v1, "android.intent.category.LAUNCHER"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    :cond_16
    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    .local v0, "recordForAppLocked":Lcom/android/server/am/ProcessRecord;
    if-eqz v0, :cond_29

    .line 49
    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    iget-object v2, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/android/server/am/PreventRunning;->onStartHomeActivity(Ljava/lang/String;)V

    .line 51
    .end local v0  # "recordForAppLocked":Lcom/android/server/am/ProcessRecord;
    :cond_29
    return p0
.end method

.method public static onUserLeavingActivity(Landroid/os/IBinder;ZZ)V
    .registers 5
    .param p0, "iBinder"  # Landroid/os/IBinder;
    .param p1, "z"  # Z
    .param p2, "z2"  # Z

    .prologue
    .line 99
    if-eqz p2, :cond_b

    .line 100
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/wm/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onUserLeavingActivity(Ljava/lang/Object;)V

    .line 102
    :cond_b
    return-void
.end method

.method public static onVpnConnectionDisconnected()V
    .registers 1

    .prologue
    .line 132
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0}, Lcom/android/server/am/PreventRunning;->onVpnConnectionDisconnected()V

    .line 133
    return-void
.end method

.method public static returnFalse()Z
    .registers 1

    .prologue
    .line 59
    const/4 v0, 0x0

    return v0
.end method

.method public static returnFalse(Z)Z
    .registers 2
    .param p0, "z"  # Z

    .prologue
    .line 63
    if-eqz p0, :cond_c

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0}, Lcom/android/server/am/PreventRunning;->isActiviated()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static setSender(Landroid/app/IApplicationThread;)V
    .registers 4
    .param p0, "iApplicationThread"  # Landroid/app/IApplicationThread;

    .prologue
    .line 78
    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    .line 79
    .local v0, "recordForAppLocked":Lcom/android/server/am/ProcessRecord;
    sget-object v2, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    if-eqz v0, :cond_14

    iget-object v1, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_10
    invoke-virtual {v2, v1}, Lcom/android/server/am/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 80
    return-void

    .line 79
    :cond_14
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_10
.end method
