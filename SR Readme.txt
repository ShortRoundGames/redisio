each server requires the attribute "instance" to be added with the instances name that you want the database to be created on


EXAMPLE USAGE :

    "redisio" : {
        "job_control" : "monit",
        "default_settings" : 
        {
            "datadir" : "/mnt/redis",
            "syslog-enabled" : "no"
        },
        "servers" : [       
            {
                "port" : "6379", 
                "name" : "pyramid", 
                "backuptype" : "aof",
                "instance" : "redis1",
                "logfile" : "/mnt/logs/redis_pyramid.log"
            },
            {
                "port" : "6380", 
                "name" : "response_cache", 
                "backuptype" : "none",
                "instance" : "redis1",
                "logfile" : "/mnt/logs/redis_response_cache.log"
            },
            {
                "port" : "6381", 
                "name" : "events", 
                "backuptype" : "aof",
                "instance" : "redis1",
                "logfile" : "/mnt/logs/redis_events.log"
            },            
            {
                "port" : "6382", 
                "name" : "race_match", 
                "backuptype" : "none",
                "instance" : "redis1",
                "logfile" : "/mnt/logs/redis_race_match.log"
            },
            {
                "port" : "6383", 
                "name" : "player_account", 
                "backuptype" : "aof",
                "instance" : "redis1",
                "logfile" : "/mnt/logs/redis_player_account.log"
            }
        ]
    },