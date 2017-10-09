# Redis

### 1  
---
    docker run --name some-redis -d redis redis-server --appendonly yes -v ~/.redis-container/data:/data

    
### 2
---
    docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
    
### 3
---

```
redis:6379> set hola comoandas
OK
redis:6379> get hola
"comoandas"
```
```
redis:6379> GETRANGE hola 2 4
"moa"
```
```
redis:6379> set hola 'como_andas'
OK
redis:6379> STRLEN hola
(integer) 10
```
```
redis:6379> MSET hola 'como_andas' chau queonda edad 18
OK
redis:6379> mget hola chau edad
1) "como_andas"
2) "queonda"
3) "18"
```

### 4
---
```
redis:6379> HMSET firsthash nombre ivan saludo 'hola, como andas?' visitas 51354
OK
redis:6379> HGETALL firsthash
1) "nombre"
2) "ivan"
3) "saludo"
4) "hola, como andas?"
5) "visitas"
6) "51354"
```
```
redis:6379> HDEL firsthash visitas
(integer) 1
redis:6379> HGETALL firsthash
1) "nombre"
2) "ivan"
3) "saludo"
4) "hola, como andas?"
```
```
redis:6379> HKEYS firsthash
1) "nombre"
2) "saludo"
```
```
redis:6379> HVALS firsthash
1) "ivan"
2) "hola, como andas?"
```
### 5
---

```
redis:6379> LPUSH lista h
(integer) 1
redis:6379> LPUSH lista 0
(integer) 2
redis:6379> LPUSH lista l
(integer) 3
redis:6379> LPUSH lista a
(integer) 4
redis:6379> LRANGE lista 0 3
1) "a"
2) "l"
3) "0"
4) "h"
```
```
redis:6379> LLEN lista
(integer) 4
```
Agrega a lista solamente si la lista existe
```
redis:6379> LPUSHX lista 50
(integer) 4
redis:6379> LRANGE lista 0 3
1) "50"
2) "a"
3) "l"
4) "0"
redis:6379> LPUSHX hola queonda
(error) WRONGTYPE Operation against a key holding the wrong kind of value
```
```
redis:6379> LPOP lista
"50"
```
### 6
---
```
redis:6379> SADD sets jesus
(integer) 1
redis:6379> SADD sets maria
(integer) 1
redis:6379> SADD sets dios
(integer) 1
redis:6379> SMEMBERS sets
1) "maria"
2) "dios"
3) "jesus"
```
```
redis:6379> SCARD sets
(integer) 3
```
```
redis:6379> SADD set2 hola
(integer) 1
redis:6379> SADD set2 chau
(integer) 1
redis:6379> SUNION sets set2
1) "chau"
2) "maria"
3) "jesus"
4) "dios"
5) "hola"
```
```
redis:6379> SISMEMBER sets dios
(integer) 1
redis:6379> SISMEMBER sets gordo
(integer) 0
```

### 7
---
```
redis:6379> ZADD sord 0 america
(integer) 1
redis:6379> ZADD sord 1 africa
(integer) 1
redis:6379> ZADD sord 2 asia
(integer) 1
redis:6379> ZADD sord 2 europa
(integer) 1
redis:6379> ZRANGE sord 0 10
1) "america"
2) "africa"
3) "asia"
4) "europa"
```
```
redis:6379> ZCARD sord
(integer) 4
```
```
redis:6379> ZRANK sord asia
(integer) 2
```
```
redis:6379> ZREM sord europa
(integer) 1
redis:6379> ZRANGE sord 0 10 WITHSCORES
1) "america"
2) "0"
3) "africa"
4) "1"
5) "asia"
6) "2"
```

### 8
---

```
redis:6379> SUBSCRIBE ivanChat
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "ivanChat"
3) (integer) 1

---- Otra terminal publish

redis:6379> PUBLISH ivanChat holaaa
(integer) 2
redis:6379> PUBLISH ivanChat goool
(integer) 2
```

### 9
---

```
redis:6379> MULTI
OK
redis:6379> SET ivan Hola
QUEUED
redis:6379> GET ivan
QUEUED
redis:6379> EXEC
1) OK
2) "Hola"
```

### 10

#### Redis SAVE command is used to create a backup of the current Redis database.

This command will create a dump.rdb file in your Redis directory.

```
redis:6379> SAVE
OK
```

To restore Redis data, move Redis backup file (dump.rdb) into your Redis directory and start the server. To get your Redis directory, use CONFIG command of Redis as shown below.

```
redis:6379> CONFIG get dir
1) "dir"
2) "/data"
```
In the output of the above command */data*  is the directory, where Redis server is installed.


### 11
---

Redis benchmark is the utility to check the performance of Redis by running n commands simultaneously.

