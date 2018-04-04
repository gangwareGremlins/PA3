
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
       6:	a1 48 5e 00 00       	mov    0x5e48,%eax
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 0a 41 00 00       	push   $0x410a
      13:	50                   	push   %eax
      14:	e8 2f 3d 00 00       	call   3d48 <printf>
      19:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
      1c:	83 ec 08             	sub    $0x8,%esp
      1f:	6a 00                	push   $0x0
      21:	68 f4 40 00 00       	push   $0x40f4
      26:	e8 db 3b 00 00       	call   3c06 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      35:	79 1b                	jns    52 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
      37:	a1 48 5e 00 00       	mov    0x5e48,%eax
      3c:	83 ec 08             	sub    $0x8,%esp
      3f:	68 15 41 00 00       	push   $0x4115
      44:	50                   	push   %eax
      45:	e8 fe 3c 00 00       	call   3d48 <printf>
      4a:	83 c4 10             	add    $0x10,%esp
    exit();
      4d:	e8 74 3b 00 00       	call   3bc6 <exit>
  }
  close(fd);
      52:	83 ec 0c             	sub    $0xc,%esp
      55:	ff 75 f4             	pushl  -0xc(%ebp)
      58:	e8 91 3b 00 00       	call   3bee <close>
      5d:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
      60:	83 ec 08             	sub    $0x8,%esp
      63:	6a 00                	push   $0x0
      65:	68 28 41 00 00       	push   $0x4128
      6a:	e8 97 3b 00 00       	call   3c06 <open>
      6f:	83 c4 10             	add    $0x10,%esp
      72:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      79:	78 1b                	js     96 <opentest+0x96>
    printf(stdout, "open doesnotexist succeeded!\n");
      7b:	a1 48 5e 00 00       	mov    0x5e48,%eax
      80:	83 ec 08             	sub    $0x8,%esp
      83:	68 35 41 00 00       	push   $0x4135
      88:	50                   	push   %eax
      89:	e8 ba 3c 00 00       	call   3d48 <printf>
      8e:	83 c4 10             	add    $0x10,%esp
    exit();
      91:	e8 30 3b 00 00       	call   3bc6 <exit>
  }
  printf(stdout, "open test ok\n");
      96:	a1 48 5e 00 00       	mov    0x5e48,%eax
      9b:	83 ec 08             	sub    $0x8,%esp
      9e:	68 53 41 00 00       	push   $0x4153
      a3:	50                   	push   %eax
      a4:	e8 9f 3c 00 00       	call   3d48 <printf>
      a9:	83 c4 10             	add    $0x10,%esp
}
      ac:	c9                   	leave  
      ad:	c3                   	ret    

000000ae <writetest>:

void
writetest(void)
{
      ae:	55                   	push   %ebp
      af:	89 e5                	mov    %esp,%ebp
      b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      b4:	a1 48 5e 00 00       	mov    0x5e48,%eax
      b9:	83 ec 08             	sub    $0x8,%esp
      bc:	68 61 41 00 00       	push   $0x4161
      c1:	50                   	push   %eax
      c2:	e8 81 3c 00 00       	call   3d48 <printf>
      c7:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
      ca:	83 ec 08             	sub    $0x8,%esp
      cd:	68 02 02 00 00       	push   $0x202
      d2:	68 72 41 00 00       	push   $0x4172
      d7:	e8 2a 3b 00 00       	call   3c06 <open>
      dc:	83 c4 10             	add    $0x10,%esp
      df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      e6:	78 22                	js     10a <writetest+0x5c>
    printf(stdout, "creat small succeeded; ok\n");
      e8:	a1 48 5e 00 00       	mov    0x5e48,%eax
      ed:	83 ec 08             	sub    $0x8,%esp
      f0:	68 78 41 00 00       	push   $0x4178
      f5:	50                   	push   %eax
      f6:	e8 4d 3c 00 00       	call   3d48 <printf>
      fb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
      fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     105:	e9 8e 00 00 00       	jmp    198 <writetest+0xea>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     10a:	a1 48 5e 00 00       	mov    0x5e48,%eax
     10f:	83 ec 08             	sub    $0x8,%esp
     112:	68 93 41 00 00       	push   $0x4193
     117:	50                   	push   %eax
     118:	e8 2b 3c 00 00       	call   3d48 <printf>
     11d:	83 c4 10             	add    $0x10,%esp
    exit();
     120:	e8 a1 3a 00 00       	call   3bc6 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     125:	83 ec 04             	sub    $0x4,%esp
     128:	6a 0a                	push   $0xa
     12a:	68 af 41 00 00       	push   $0x41af
     12f:	ff 75 f0             	pushl  -0x10(%ebp)
     132:	e8 af 3a 00 00       	call   3be6 <write>
     137:	83 c4 10             	add    $0x10,%esp
     13a:	83 f8 0a             	cmp    $0xa,%eax
     13d:	74 1e                	je     15d <writetest+0xaf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     13f:	a1 48 5e 00 00       	mov    0x5e48,%eax
     144:	83 ec 04             	sub    $0x4,%esp
     147:	ff 75 f4             	pushl  -0xc(%ebp)
     14a:	68 bc 41 00 00       	push   $0x41bc
     14f:	50                   	push   %eax
     150:	e8 f3 3b 00 00       	call   3d48 <printf>
     155:	83 c4 10             	add    $0x10,%esp
      exit();
     158:	e8 69 3a 00 00       	call   3bc6 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     15d:	83 ec 04             	sub    $0x4,%esp
     160:	6a 0a                	push   $0xa
     162:	68 e0 41 00 00       	push   $0x41e0
     167:	ff 75 f0             	pushl  -0x10(%ebp)
     16a:	e8 77 3a 00 00       	call   3be6 <write>
     16f:	83 c4 10             	add    $0x10,%esp
     172:	83 f8 0a             	cmp    $0xa,%eax
     175:	74 1e                	je     195 <writetest+0xe7>
      printf(stdout, "error: write bb %d new file failed\n", i);
     177:	a1 48 5e 00 00       	mov    0x5e48,%eax
     17c:	83 ec 04             	sub    $0x4,%esp
     17f:	ff 75 f4             	pushl  -0xc(%ebp)
     182:	68 ec 41 00 00       	push   $0x41ec
     187:	50                   	push   %eax
     188:	e8 bb 3b 00 00       	call   3d48 <printf>
     18d:	83 c4 10             	add    $0x10,%esp
      exit();
     190:	e8 31 3a 00 00       	call   3bc6 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     195:	ff 45 f4             	incl   -0xc(%ebp)
     198:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     19c:	7e 87                	jle    125 <writetest+0x77>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     19e:	a1 48 5e 00 00       	mov    0x5e48,%eax
     1a3:	83 ec 08             	sub    $0x8,%esp
     1a6:	68 10 42 00 00       	push   $0x4210
     1ab:	50                   	push   %eax
     1ac:	e8 97 3b 00 00       	call   3d48 <printf>
     1b1:	83 c4 10             	add    $0x10,%esp
  close(fd);
     1b4:	83 ec 0c             	sub    $0xc,%esp
     1b7:	ff 75 f0             	pushl  -0x10(%ebp)
     1ba:	e8 2f 3a 00 00       	call   3bee <close>
     1bf:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     1c2:	83 ec 08             	sub    $0x8,%esp
     1c5:	6a 00                	push   $0x0
     1c7:	68 72 41 00 00       	push   $0x4172
     1cc:	e8 35 3a 00 00       	call   3c06 <open>
     1d1:	83 c4 10             	add    $0x10,%esp
     1d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     1d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1db:	78 3c                	js     219 <writetest+0x16b>
    printf(stdout, "open small succeeded ok\n");
     1dd:	a1 48 5e 00 00       	mov    0x5e48,%eax
     1e2:	83 ec 08             	sub    $0x8,%esp
     1e5:	68 1b 42 00 00       	push   $0x421b
     1ea:	50                   	push   %eax
     1eb:	e8 58 3b 00 00       	call   3d48 <printf>
     1f0:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     1f3:	83 ec 04             	sub    $0x4,%esp
     1f6:	68 d0 07 00 00       	push   $0x7d0
     1fb:	68 40 86 00 00       	push   $0x8640
     200:	ff 75 f0             	pushl  -0x10(%ebp)
     203:	e8 d6 39 00 00       	call   3bde <read>
     208:	83 c4 10             	add    $0x10,%esp
     20b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     20e:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     215:	75 57                	jne    26e <writetest+0x1c0>
     217:	eb 1b                	jmp    234 <writetest+0x186>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     219:	a1 48 5e 00 00       	mov    0x5e48,%eax
     21e:	83 ec 08             	sub    $0x8,%esp
     221:	68 34 42 00 00       	push   $0x4234
     226:	50                   	push   %eax
     227:	e8 1c 3b 00 00       	call   3d48 <printf>
     22c:	83 c4 10             	add    $0x10,%esp
    exit();
     22f:	e8 92 39 00 00       	call   3bc6 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     234:	a1 48 5e 00 00       	mov    0x5e48,%eax
     239:	83 ec 08             	sub    $0x8,%esp
     23c:	68 4f 42 00 00       	push   $0x424f
     241:	50                   	push   %eax
     242:	e8 01 3b 00 00       	call   3d48 <printf>
     247:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     24a:	83 ec 0c             	sub    $0xc,%esp
     24d:	ff 75 f0             	pushl  -0x10(%ebp)
     250:	e8 99 39 00 00       	call   3bee <close>
     255:	83 c4 10             	add    $0x10,%esp

  if(unlink("small") < 0){
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	68 72 41 00 00       	push   $0x4172
     260:	e8 b1 39 00 00       	call   3c16 <unlink>
     265:	83 c4 10             	add    $0x10,%esp
     268:	85 c0                	test   %eax,%eax
     26a:	79 38                	jns    2a4 <writetest+0x1f6>
     26c:	eb 1b                	jmp    289 <writetest+0x1db>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     26e:	a1 48 5e 00 00       	mov    0x5e48,%eax
     273:	83 ec 08             	sub    $0x8,%esp
     276:	68 62 42 00 00       	push   $0x4262
     27b:	50                   	push   %eax
     27c:	e8 c7 3a 00 00       	call   3d48 <printf>
     281:	83 c4 10             	add    $0x10,%esp
    exit();
     284:	e8 3d 39 00 00       	call   3bc6 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     289:	a1 48 5e 00 00       	mov    0x5e48,%eax
     28e:	83 ec 08             	sub    $0x8,%esp
     291:	68 6f 42 00 00       	push   $0x426f
     296:	50                   	push   %eax
     297:	e8 ac 3a 00 00       	call   3d48 <printf>
     29c:	83 c4 10             	add    $0x10,%esp
    exit();
     29f:	e8 22 39 00 00       	call   3bc6 <exit>
  }
  printf(stdout, "small file test ok\n");
     2a4:	a1 48 5e 00 00       	mov    0x5e48,%eax
     2a9:	83 ec 08             	sub    $0x8,%esp
     2ac:	68 84 42 00 00       	push   $0x4284
     2b1:	50                   	push   %eax
     2b2:	e8 91 3a 00 00       	call   3d48 <printf>
     2b7:	83 c4 10             	add    $0x10,%esp
}
     2ba:	c9                   	leave  
     2bb:	c3                   	ret    

000002bc <writetest1>:

void
writetest1(void)
{
     2bc:	55                   	push   %ebp
     2bd:	89 e5                	mov    %esp,%ebp
     2bf:	83 ec 18             	sub    $0x18,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2c2:	a1 48 5e 00 00       	mov    0x5e48,%eax
     2c7:	83 ec 08             	sub    $0x8,%esp
     2ca:	68 98 42 00 00       	push   $0x4298
     2cf:	50                   	push   %eax
     2d0:	e8 73 3a 00 00       	call   3d48 <printf>
     2d5:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_CREATE|O_RDWR);
     2d8:	83 ec 08             	sub    $0x8,%esp
     2db:	68 02 02 00 00       	push   $0x202
     2e0:	68 a8 42 00 00       	push   $0x42a8
     2e5:	e8 1c 39 00 00       	call   3c06 <open>
     2ea:	83 c4 10             	add    $0x10,%esp
     2ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     2f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2f4:	79 1b                	jns    311 <writetest1+0x55>
    printf(stdout, "error: creat big failed!\n");
     2f6:	a1 48 5e 00 00       	mov    0x5e48,%eax
     2fb:	83 ec 08             	sub    $0x8,%esp
     2fe:	68 ac 42 00 00       	push   $0x42ac
     303:	50                   	push   %eax
     304:	e8 3f 3a 00 00       	call   3d48 <printf>
     309:	83 c4 10             	add    $0x10,%esp
    exit();
     30c:	e8 b5 38 00 00       	call   3bc6 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     311:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     318:	eb 4a                	jmp    364 <writetest1+0xa8>
    ((int*)buf)[0] = i;
     31a:	b8 40 86 00 00       	mov    $0x8640,%eax
     31f:	8b 55 f4             	mov    -0xc(%ebp),%edx
     322:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     324:	83 ec 04             	sub    $0x4,%esp
     327:	68 00 02 00 00       	push   $0x200
     32c:	68 40 86 00 00       	push   $0x8640
     331:	ff 75 ec             	pushl  -0x14(%ebp)
     334:	e8 ad 38 00 00       	call   3be6 <write>
     339:	83 c4 10             	add    $0x10,%esp
     33c:	3d 00 02 00 00       	cmp    $0x200,%eax
     341:	74 1e                	je     361 <writetest1+0xa5>
      printf(stdout, "error: write big file failed\n", i);
     343:	a1 48 5e 00 00       	mov    0x5e48,%eax
     348:	83 ec 04             	sub    $0x4,%esp
     34b:	ff 75 f4             	pushl  -0xc(%ebp)
     34e:	68 c6 42 00 00       	push   $0x42c6
     353:	50                   	push   %eax
     354:	e8 ef 39 00 00       	call   3d48 <printf>
     359:	83 c4 10             	add    $0x10,%esp
      exit();
     35c:	e8 65 38 00 00       	call   3bc6 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     361:	ff 45 f4             	incl   -0xc(%ebp)
     364:	8b 45 f4             	mov    -0xc(%ebp),%eax
     367:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     36c:	76 ac                	jbe    31a <writetest1+0x5e>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     36e:	83 ec 0c             	sub    $0xc,%esp
     371:	ff 75 ec             	pushl  -0x14(%ebp)
     374:	e8 75 38 00 00       	call   3bee <close>
     379:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_RDONLY);
     37c:	83 ec 08             	sub    $0x8,%esp
     37f:	6a 00                	push   $0x0
     381:	68 a8 42 00 00       	push   $0x42a8
     386:	e8 7b 38 00 00       	call   3c06 <open>
     38b:	83 c4 10             	add    $0x10,%esp
     38e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     391:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     395:	79 1b                	jns    3b2 <writetest1+0xf6>
    printf(stdout, "error: open big failed!\n");
     397:	a1 48 5e 00 00       	mov    0x5e48,%eax
     39c:	83 ec 08             	sub    $0x8,%esp
     39f:	68 e4 42 00 00       	push   $0x42e4
     3a4:	50                   	push   %eax
     3a5:	e8 9e 39 00 00       	call   3d48 <printf>
     3aa:	83 c4 10             	add    $0x10,%esp
    exit();
     3ad:	e8 14 38 00 00       	call   3bc6 <exit>
  }

  n = 0;
     3b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     3b9:	83 ec 04             	sub    $0x4,%esp
     3bc:	68 00 02 00 00       	push   $0x200
     3c1:	68 40 86 00 00       	push   $0x8640
     3c6:	ff 75 ec             	pushl  -0x14(%ebp)
     3c9:	e8 10 38 00 00       	call   3bde <read>
     3ce:	83 c4 10             	add    $0x10,%esp
     3d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     3d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3d8:	75 4c                	jne    426 <writetest1+0x16a>
      if(n == MAXFILE - 1){
     3da:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     3e1:	75 1e                	jne    401 <writetest1+0x145>
        printf(stdout, "read only %d blocks from big", n);
     3e3:	a1 48 5e 00 00       	mov    0x5e48,%eax
     3e8:	83 ec 04             	sub    $0x4,%esp
     3eb:	ff 75 f0             	pushl  -0x10(%ebp)
     3ee:	68 fd 42 00 00       	push   $0x42fd
     3f3:	50                   	push   %eax
     3f4:	e8 4f 39 00 00       	call   3d48 <printf>
     3f9:	83 c4 10             	add    $0x10,%esp
        exit();
     3fc:	e8 c5 37 00 00       	call   3bc6 <exit>
      }
      break;
     401:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     402:	83 ec 0c             	sub    $0xc,%esp
     405:	ff 75 ec             	pushl  -0x14(%ebp)
     408:	e8 e1 37 00 00       	call   3bee <close>
     40d:	83 c4 10             	add    $0x10,%esp
  if(unlink("big") < 0){
     410:	83 ec 0c             	sub    $0xc,%esp
     413:	68 a8 42 00 00       	push   $0x42a8
     418:	e8 f9 37 00 00       	call   3c16 <unlink>
     41d:	83 c4 10             	add    $0x10,%esp
     420:	85 c0                	test   %eax,%eax
     422:	79 7b                	jns    49f <writetest1+0x1e3>
     424:	eb 5e                	jmp    484 <writetest1+0x1c8>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     426:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     42d:	74 1e                	je     44d <writetest1+0x191>
      printf(stdout, "read failed %d\n", i);
     42f:	a1 48 5e 00 00       	mov    0x5e48,%eax
     434:	83 ec 04             	sub    $0x4,%esp
     437:	ff 75 f4             	pushl  -0xc(%ebp)
     43a:	68 1a 43 00 00       	push   $0x431a
     43f:	50                   	push   %eax
     440:	e8 03 39 00 00       	call   3d48 <printf>
     445:	83 c4 10             	add    $0x10,%esp
      exit();
     448:	e8 79 37 00 00       	call   3bc6 <exit>
    }
    if(((int*)buf)[0] != n){
     44d:	b8 40 86 00 00       	mov    $0x8640,%eax
     452:	8b 00                	mov    (%eax),%eax
     454:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     457:	74 23                	je     47c <writetest1+0x1c0>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     459:	b8 40 86 00 00       	mov    $0x8640,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     45e:	8b 10                	mov    (%eax),%edx
     460:	a1 48 5e 00 00       	mov    0x5e48,%eax
     465:	52                   	push   %edx
     466:	ff 75 f0             	pushl  -0x10(%ebp)
     469:	68 2c 43 00 00       	push   $0x432c
     46e:	50                   	push   %eax
     46f:	e8 d4 38 00 00       	call   3d48 <printf>
     474:	83 c4 10             	add    $0x10,%esp
             n, ((int*)buf)[0]);
      exit();
     477:	e8 4a 37 00 00       	call   3bc6 <exit>
    }
    n++;
     47c:	ff 45 f0             	incl   -0x10(%ebp)
  }
     47f:	e9 35 ff ff ff       	jmp    3b9 <writetest1+0xfd>
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     484:	a1 48 5e 00 00       	mov    0x5e48,%eax
     489:	83 ec 08             	sub    $0x8,%esp
     48c:	68 4c 43 00 00       	push   $0x434c
     491:	50                   	push   %eax
     492:	e8 b1 38 00 00       	call   3d48 <printf>
     497:	83 c4 10             	add    $0x10,%esp
    exit();
     49a:	e8 27 37 00 00       	call   3bc6 <exit>
  }
  printf(stdout, "big files ok\n");
     49f:	a1 48 5e 00 00       	mov    0x5e48,%eax
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	68 5f 43 00 00       	push   $0x435f
     4ac:	50                   	push   %eax
     4ad:	e8 96 38 00 00       	call   3d48 <printf>
     4b2:	83 c4 10             	add    $0x10,%esp
}
     4b5:	c9                   	leave  
     4b6:	c3                   	ret    

000004b7 <createtest>:

void
createtest(void)
{
     4b7:	55                   	push   %ebp
     4b8:	89 e5                	mov    %esp,%ebp
     4ba:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4bd:	a1 48 5e 00 00       	mov    0x5e48,%eax
     4c2:	83 ec 08             	sub    $0x8,%esp
     4c5:	68 70 43 00 00       	push   $0x4370
     4ca:	50                   	push   %eax
     4cb:	e8 78 38 00 00       	call   3d48 <printf>
     4d0:	83 c4 10             	add    $0x10,%esp

  name[0] = 'a';
     4d3:	c6 05 40 a6 00 00 61 	movb   $0x61,0xa640
  name[2] = '\0';
     4da:	c6 05 42 a6 00 00 00 	movb   $0x0,0xa642
  for(i = 0; i < 52; i++){
     4e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4e8:	eb 34                	jmp    51e <createtest+0x67>
    name[1] = '0' + i;
     4ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ed:	83 c0 30             	add    $0x30,%eax
     4f0:	a2 41 a6 00 00       	mov    %al,0xa641
    fd = open(name, O_CREATE|O_RDWR);
     4f5:	83 ec 08             	sub    $0x8,%esp
     4f8:	68 02 02 00 00       	push   $0x202
     4fd:	68 40 a6 00 00       	push   $0xa640
     502:	e8 ff 36 00 00       	call   3c06 <open>
     507:	83 c4 10             	add    $0x10,%esp
     50a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     50d:	83 ec 0c             	sub    $0xc,%esp
     510:	ff 75 f0             	pushl  -0x10(%ebp)
     513:	e8 d6 36 00 00       	call   3bee <close>
     518:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     51b:	ff 45 f4             	incl   -0xc(%ebp)
     51e:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     522:	7e c6                	jle    4ea <createtest+0x33>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     524:	c6 05 40 a6 00 00 61 	movb   $0x61,0xa640
  name[2] = '\0';
     52b:	c6 05 42 a6 00 00 00 	movb   $0x0,0xa642
  for(i = 0; i < 52; i++){
     532:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     539:	eb 1e                	jmp    559 <createtest+0xa2>
    name[1] = '0' + i;
     53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     53e:	83 c0 30             	add    $0x30,%eax
     541:	a2 41 a6 00 00       	mov    %al,0xa641
    unlink(name);
     546:	83 ec 0c             	sub    $0xc,%esp
     549:	68 40 a6 00 00       	push   $0xa640
     54e:	e8 c3 36 00 00       	call   3c16 <unlink>
     553:	83 c4 10             	add    $0x10,%esp
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     556:	ff 45 f4             	incl   -0xc(%ebp)
     559:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     55d:	7e dc                	jle    53b <createtest+0x84>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     55f:	a1 48 5e 00 00       	mov    0x5e48,%eax
     564:	83 ec 08             	sub    $0x8,%esp
     567:	68 98 43 00 00       	push   $0x4398
     56c:	50                   	push   %eax
     56d:	e8 d6 37 00 00       	call   3d48 <printf>
     572:	83 c4 10             	add    $0x10,%esp
}
     575:	c9                   	leave  
     576:	c3                   	ret    

00000577 <dirtest>:

void dirtest(void)
{
     577:	55                   	push   %ebp
     578:	89 e5                	mov    %esp,%ebp
     57a:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "mkdir test\n");
     57d:	a1 48 5e 00 00       	mov    0x5e48,%eax
     582:	83 ec 08             	sub    $0x8,%esp
     585:	68 be 43 00 00       	push   $0x43be
     58a:	50                   	push   %eax
     58b:	e8 b8 37 00 00       	call   3d48 <printf>
     590:	83 c4 10             	add    $0x10,%esp

  if(mkdir("dir0") < 0){
     593:	83 ec 0c             	sub    $0xc,%esp
     596:	68 ca 43 00 00       	push   $0x43ca
     59b:	e8 8e 36 00 00       	call   3c2e <mkdir>
     5a0:	83 c4 10             	add    $0x10,%esp
     5a3:	85 c0                	test   %eax,%eax
     5a5:	79 1b                	jns    5c2 <dirtest+0x4b>
    printf(stdout, "mkdir failed\n");
     5a7:	a1 48 5e 00 00       	mov    0x5e48,%eax
     5ac:	83 ec 08             	sub    $0x8,%esp
     5af:	68 cf 43 00 00       	push   $0x43cf
     5b4:	50                   	push   %eax
     5b5:	e8 8e 37 00 00       	call   3d48 <printf>
     5ba:	83 c4 10             	add    $0x10,%esp
    exit();
     5bd:	e8 04 36 00 00       	call   3bc6 <exit>
  }

  if(chdir("dir0") < 0){
     5c2:	83 ec 0c             	sub    $0xc,%esp
     5c5:	68 ca 43 00 00       	push   $0x43ca
     5ca:	e8 67 36 00 00       	call   3c36 <chdir>
     5cf:	83 c4 10             	add    $0x10,%esp
     5d2:	85 c0                	test   %eax,%eax
     5d4:	79 1b                	jns    5f1 <dirtest+0x7a>
    printf(stdout, "chdir dir0 failed\n");
     5d6:	a1 48 5e 00 00       	mov    0x5e48,%eax
     5db:	83 ec 08             	sub    $0x8,%esp
     5de:	68 dd 43 00 00       	push   $0x43dd
     5e3:	50                   	push   %eax
     5e4:	e8 5f 37 00 00       	call   3d48 <printf>
     5e9:	83 c4 10             	add    $0x10,%esp
    exit();
     5ec:	e8 d5 35 00 00       	call   3bc6 <exit>
  }

  if(chdir("..") < 0){
     5f1:	83 ec 0c             	sub    $0xc,%esp
     5f4:	68 f0 43 00 00       	push   $0x43f0
     5f9:	e8 38 36 00 00       	call   3c36 <chdir>
     5fe:	83 c4 10             	add    $0x10,%esp
     601:	85 c0                	test   %eax,%eax
     603:	79 1b                	jns    620 <dirtest+0xa9>
    printf(stdout, "chdir .. failed\n");
     605:	a1 48 5e 00 00       	mov    0x5e48,%eax
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	68 f3 43 00 00       	push   $0x43f3
     612:	50                   	push   %eax
     613:	e8 30 37 00 00       	call   3d48 <printf>
     618:	83 c4 10             	add    $0x10,%esp
    exit();
     61b:	e8 a6 35 00 00       	call   3bc6 <exit>
  }

  if(unlink("dir0") < 0){
     620:	83 ec 0c             	sub    $0xc,%esp
     623:	68 ca 43 00 00       	push   $0x43ca
     628:	e8 e9 35 00 00       	call   3c16 <unlink>
     62d:	83 c4 10             	add    $0x10,%esp
     630:	85 c0                	test   %eax,%eax
     632:	79 1b                	jns    64f <dirtest+0xd8>
    printf(stdout, "unlink dir0 failed\n");
     634:	a1 48 5e 00 00       	mov    0x5e48,%eax
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	68 04 44 00 00       	push   $0x4404
     641:	50                   	push   %eax
     642:	e8 01 37 00 00       	call   3d48 <printf>
     647:	83 c4 10             	add    $0x10,%esp
    exit();
     64a:	e8 77 35 00 00       	call   3bc6 <exit>
  }
  printf(stdout, "mkdir test\n");
     64f:	a1 48 5e 00 00       	mov    0x5e48,%eax
     654:	83 ec 08             	sub    $0x8,%esp
     657:	68 be 43 00 00       	push   $0x43be
     65c:	50                   	push   %eax
     65d:	e8 e6 36 00 00       	call   3d48 <printf>
     662:	83 c4 10             	add    $0x10,%esp
}
     665:	c9                   	leave  
     666:	c3                   	ret    

00000667 <exectest>:

void
exectest(void)
{
     667:	55                   	push   %ebp
     668:	89 e5                	mov    %esp,%ebp
     66a:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "exec test\n");
     66d:	a1 48 5e 00 00       	mov    0x5e48,%eax
     672:	83 ec 08             	sub    $0x8,%esp
     675:	68 18 44 00 00       	push   $0x4418
     67a:	50                   	push   %eax
     67b:	e8 c8 36 00 00       	call   3d48 <printf>
     680:	83 c4 10             	add    $0x10,%esp
  if(exec("echo", echoargv) < 0){
     683:	83 ec 08             	sub    $0x8,%esp
     686:	68 34 5e 00 00       	push   $0x5e34
     68b:	68 f4 40 00 00       	push   $0x40f4
     690:	e8 69 35 00 00       	call   3bfe <exec>
     695:	83 c4 10             	add    $0x10,%esp
     698:	85 c0                	test   %eax,%eax
     69a:	79 1b                	jns    6b7 <exectest+0x50>
    printf(stdout, "exec echo failed\n");
     69c:	a1 48 5e 00 00       	mov    0x5e48,%eax
     6a1:	83 ec 08             	sub    $0x8,%esp
     6a4:	68 23 44 00 00       	push   $0x4423
     6a9:	50                   	push   %eax
     6aa:	e8 99 36 00 00       	call   3d48 <printf>
     6af:	83 c4 10             	add    $0x10,%esp
    exit();
     6b2:	e8 0f 35 00 00       	call   3bc6 <exit>
  }
}
     6b7:	c9                   	leave  
     6b8:	c3                   	ret    

000006b9 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     6b9:	55                   	push   %ebp
     6ba:	89 e5                	mov    %esp,%ebp
     6bc:	83 ec 28             	sub    $0x28,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6bf:	83 ec 0c             	sub    $0xc,%esp
     6c2:	8d 45 d8             	lea    -0x28(%ebp),%eax
     6c5:	50                   	push   %eax
     6c6:	e8 0b 35 00 00       	call   3bd6 <pipe>
     6cb:	83 c4 10             	add    $0x10,%esp
     6ce:	85 c0                	test   %eax,%eax
     6d0:	74 17                	je     6e9 <pipe1+0x30>
    printf(1, "pipe() failed\n");
     6d2:	83 ec 08             	sub    $0x8,%esp
     6d5:	68 35 44 00 00       	push   $0x4435
     6da:	6a 01                	push   $0x1
     6dc:	e8 67 36 00 00       	call   3d48 <printf>
     6e1:	83 c4 10             	add    $0x10,%esp
    exit();
     6e4:	e8 dd 34 00 00       	call   3bc6 <exit>
  }
  pid = fork();
     6e9:	e8 d0 34 00 00       	call   3bbe <fork>
     6ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     6f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     6f8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     6fc:	0f 85 86 00 00 00    	jne    788 <pipe1+0xcf>
    close(fds[0]);
     702:	8b 45 d8             	mov    -0x28(%ebp),%eax
     705:	83 ec 0c             	sub    $0xc,%esp
     708:	50                   	push   %eax
     709:	e8 e0 34 00 00       	call   3bee <close>
     70e:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     711:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     718:	eb 63                	jmp    77d <pipe1+0xc4>
      for(i = 0; i < 1033; i++)
     71a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     721:	eb 17                	jmp    73a <pipe1+0x81>
        buf[i] = seq++;
     723:	8b 45 f4             	mov    -0xc(%ebp),%eax
     726:	8d 50 01             	lea    0x1(%eax),%edx
     729:	89 55 f4             	mov    %edx,-0xc(%ebp)
     72c:	8b 55 f0             	mov    -0x10(%ebp),%edx
     72f:	81 c2 40 86 00 00    	add    $0x8640,%edx
     735:	88 02                	mov    %al,(%edx)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     737:	ff 45 f0             	incl   -0x10(%ebp)
     73a:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     741:	7e e0                	jle    723 <pipe1+0x6a>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     743:	8b 45 dc             	mov    -0x24(%ebp),%eax
     746:	83 ec 04             	sub    $0x4,%esp
     749:	68 09 04 00 00       	push   $0x409
     74e:	68 40 86 00 00       	push   $0x8640
     753:	50                   	push   %eax
     754:	e8 8d 34 00 00       	call   3be6 <write>
     759:	83 c4 10             	add    $0x10,%esp
     75c:	3d 09 04 00 00       	cmp    $0x409,%eax
     761:	74 17                	je     77a <pipe1+0xc1>
        printf(1, "pipe1 oops 1\n");
     763:	83 ec 08             	sub    $0x8,%esp
     766:	68 44 44 00 00       	push   $0x4444
     76b:	6a 01                	push   $0x1
     76d:	e8 d6 35 00 00       	call   3d48 <printf>
     772:	83 c4 10             	add    $0x10,%esp
        exit();
     775:	e8 4c 34 00 00       	call   3bc6 <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     77a:	ff 45 ec             	incl   -0x14(%ebp)
     77d:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     781:	7e 97                	jle    71a <pipe1+0x61>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     783:	e8 3e 34 00 00       	call   3bc6 <exit>
  } else if(pid > 0){
     788:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     78c:	0f 8e f7 00 00 00    	jle    889 <pipe1+0x1d0>
    close(fds[1]);
     792:	8b 45 dc             	mov    -0x24(%ebp),%eax
     795:	83 ec 0c             	sub    $0xc,%esp
     798:	50                   	push   %eax
     799:	e8 50 34 00 00       	call   3bee <close>
     79e:	83 c4 10             	add    $0x10,%esp
    total = 0;
     7a1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     7a8:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     7af:	eb 69                	jmp    81a <pipe1+0x161>
      for(i = 0; i < n; i++){
     7b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     7b8:	eb 39                	jmp    7f3 <pipe1+0x13a>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     7ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7bd:	05 40 86 00 00       	add    $0x8640,%eax
     7c2:	8a 00                	mov    (%eax),%al
     7c4:	0f be c8             	movsbl %al,%ecx
     7c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7ca:	8d 50 01             	lea    0x1(%eax),%edx
     7cd:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7d0:	31 c8                	xor    %ecx,%eax
     7d2:	0f b6 c0             	movzbl %al,%eax
     7d5:	85 c0                	test   %eax,%eax
     7d7:	74 17                	je     7f0 <pipe1+0x137>
          printf(1, "pipe1 oops 2\n");
     7d9:	83 ec 08             	sub    $0x8,%esp
     7dc:	68 52 44 00 00       	push   $0x4452
     7e1:	6a 01                	push   $0x1
     7e3:	e8 60 35 00 00       	call   3d48 <printf>
     7e8:	83 c4 10             	add    $0x10,%esp
     7eb:	e9 b0 00 00 00       	jmp    8a0 <pipe1+0x1e7>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     7f0:	ff 45 f0             	incl   -0x10(%ebp)
     7f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7f6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     7f9:	7c bf                	jl     7ba <pipe1+0x101>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     7fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
     7fe:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     801:	8b 45 e8             	mov    -0x18(%ebp),%eax
     804:	01 c0                	add    %eax,%eax
     806:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc > sizeof(buf))
     809:	8b 45 e8             	mov    -0x18(%ebp),%eax
     80c:	3d 00 20 00 00       	cmp    $0x2000,%eax
     811:	76 07                	jbe    81a <pipe1+0x161>
        cc = sizeof(buf);
     813:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     81a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     81d:	83 ec 04             	sub    $0x4,%esp
     820:	ff 75 e8             	pushl  -0x18(%ebp)
     823:	68 40 86 00 00       	push   $0x8640
     828:	50                   	push   %eax
     829:	e8 b0 33 00 00       	call   3bde <read>
     82e:	83 c4 10             	add    $0x10,%esp
     831:	89 45 ec             	mov    %eax,-0x14(%ebp)
     834:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     838:	0f 8f 73 ff ff ff    	jg     7b1 <pipe1+0xf8>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     83e:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     845:	74 1a                	je     861 <pipe1+0x1a8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     847:	83 ec 04             	sub    $0x4,%esp
     84a:	ff 75 e4             	pushl  -0x1c(%ebp)
     84d:	68 60 44 00 00       	push   $0x4460
     852:	6a 01                	push   $0x1
     854:	e8 ef 34 00 00       	call   3d48 <printf>
     859:	83 c4 10             	add    $0x10,%esp
      exit();
     85c:	e8 65 33 00 00       	call   3bc6 <exit>
    }
    close(fds[0]);
     861:	8b 45 d8             	mov    -0x28(%ebp),%eax
     864:	83 ec 0c             	sub    $0xc,%esp
     867:	50                   	push   %eax
     868:	e8 81 33 00 00       	call   3bee <close>
     86d:	83 c4 10             	add    $0x10,%esp
    wait();
     870:	e8 59 33 00 00       	call   3bce <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     875:	83 ec 08             	sub    $0x8,%esp
     878:	68 86 44 00 00       	push   $0x4486
     87d:	6a 01                	push   $0x1
     87f:	e8 c4 34 00 00       	call   3d48 <printf>
     884:	83 c4 10             	add    $0x10,%esp
     887:	eb 17                	jmp    8a0 <pipe1+0x1e7>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     889:	83 ec 08             	sub    $0x8,%esp
     88c:	68 77 44 00 00       	push   $0x4477
     891:	6a 01                	push   $0x1
     893:	e8 b0 34 00 00       	call   3d48 <printf>
     898:	83 c4 10             	add    $0x10,%esp
    exit();
     89b:	e8 26 33 00 00       	call   3bc6 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     8a0:	c9                   	leave  
     8a1:	c3                   	ret    

000008a2 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     8a2:	55                   	push   %ebp
     8a3:	89 e5                	mov    %esp,%ebp
     8a5:	83 ec 28             	sub    $0x28,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     8a8:	83 ec 08             	sub    $0x8,%esp
     8ab:	68 90 44 00 00       	push   $0x4490
     8b0:	6a 01                	push   $0x1
     8b2:	e8 91 34 00 00       	call   3d48 <printf>
     8b7:	83 c4 10             	add    $0x10,%esp
  pid1 = fork();
     8ba:	e8 ff 32 00 00       	call   3bbe <fork>
     8bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     8c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8c6:	75 02                	jne    8ca <preempt+0x28>
    for(;;)
      ;
     8c8:	eb fe                	jmp    8c8 <preempt+0x26>

  pid2 = fork();
     8ca:	e8 ef 32 00 00       	call   3bbe <fork>
     8cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     8d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     8d6:	75 02                	jne    8da <preempt+0x38>
    for(;;)
      ;
     8d8:	eb fe                	jmp    8d8 <preempt+0x36>

  pipe(pfds);
     8da:	83 ec 0c             	sub    $0xc,%esp
     8dd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8e0:	50                   	push   %eax
     8e1:	e8 f0 32 00 00       	call   3bd6 <pipe>
     8e6:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     8e9:	e8 d0 32 00 00       	call   3bbe <fork>
     8ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     8f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8f5:	75 4d                	jne    944 <preempt+0xa2>
    close(pfds[0]);
     8f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8fa:	83 ec 0c             	sub    $0xc,%esp
     8fd:	50                   	push   %eax
     8fe:	e8 eb 32 00 00       	call   3bee <close>
     903:	83 c4 10             	add    $0x10,%esp
    if(write(pfds[1], "x", 1) != 1)
     906:	8b 45 e8             	mov    -0x18(%ebp),%eax
     909:	83 ec 04             	sub    $0x4,%esp
     90c:	6a 01                	push   $0x1
     90e:	68 9a 44 00 00       	push   $0x449a
     913:	50                   	push   %eax
     914:	e8 cd 32 00 00       	call   3be6 <write>
     919:	83 c4 10             	add    $0x10,%esp
     91c:	83 f8 01             	cmp    $0x1,%eax
     91f:	74 12                	je     933 <preempt+0x91>
      printf(1, "preempt write error");
     921:	83 ec 08             	sub    $0x8,%esp
     924:	68 9c 44 00 00       	push   $0x449c
     929:	6a 01                	push   $0x1
     92b:	e8 18 34 00 00       	call   3d48 <printf>
     930:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     933:	8b 45 e8             	mov    -0x18(%ebp),%eax
     936:	83 ec 0c             	sub    $0xc,%esp
     939:	50                   	push   %eax
     93a:	e8 af 32 00 00       	call   3bee <close>
     93f:	83 c4 10             	add    $0x10,%esp
    for(;;)
      ;
     942:	eb fe                	jmp    942 <preempt+0xa0>
  }

  close(pfds[1]);
     944:	8b 45 e8             	mov    -0x18(%ebp),%eax
     947:	83 ec 0c             	sub    $0xc,%esp
     94a:	50                   	push   %eax
     94b:	e8 9e 32 00 00       	call   3bee <close>
     950:	83 c4 10             	add    $0x10,%esp
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     953:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     956:	83 ec 04             	sub    $0x4,%esp
     959:	68 00 20 00 00       	push   $0x2000
     95e:	68 40 86 00 00       	push   $0x8640
     963:	50                   	push   %eax
     964:	e8 75 32 00 00       	call   3bde <read>
     969:	83 c4 10             	add    $0x10,%esp
     96c:	83 f8 01             	cmp    $0x1,%eax
     96f:	74 14                	je     985 <preempt+0xe3>
    printf(1, "preempt read error");
     971:	83 ec 08             	sub    $0x8,%esp
     974:	68 b0 44 00 00       	push   $0x44b0
     979:	6a 01                	push   $0x1
     97b:	e8 c8 33 00 00       	call   3d48 <printf>
     980:	83 c4 10             	add    $0x10,%esp
     983:	eb 7e                	jmp    a03 <preempt+0x161>
    return;
  }
  close(pfds[0]);
     985:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     988:	83 ec 0c             	sub    $0xc,%esp
     98b:	50                   	push   %eax
     98c:	e8 5d 32 00 00       	call   3bee <close>
     991:	83 c4 10             	add    $0x10,%esp
  printf(1, "kill... ");
     994:	83 ec 08             	sub    $0x8,%esp
     997:	68 c3 44 00 00       	push   $0x44c3
     99c:	6a 01                	push   $0x1
     99e:	e8 a5 33 00 00       	call   3d48 <printf>
     9a3:	83 c4 10             	add    $0x10,%esp
  kill(pid1);
     9a6:	83 ec 0c             	sub    $0xc,%esp
     9a9:	ff 75 f4             	pushl  -0xc(%ebp)
     9ac:	e8 45 32 00 00       	call   3bf6 <kill>
     9b1:	83 c4 10             	add    $0x10,%esp
  kill(pid2);
     9b4:	83 ec 0c             	sub    $0xc,%esp
     9b7:	ff 75 f0             	pushl  -0x10(%ebp)
     9ba:	e8 37 32 00 00       	call   3bf6 <kill>
     9bf:	83 c4 10             	add    $0x10,%esp
  kill(pid3);
     9c2:	83 ec 0c             	sub    $0xc,%esp
     9c5:	ff 75 ec             	pushl  -0x14(%ebp)
     9c8:	e8 29 32 00 00       	call   3bf6 <kill>
     9cd:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
     9d0:	83 ec 08             	sub    $0x8,%esp
     9d3:	68 cc 44 00 00       	push   $0x44cc
     9d8:	6a 01                	push   $0x1
     9da:	e8 69 33 00 00       	call   3d48 <printf>
     9df:	83 c4 10             	add    $0x10,%esp
  wait();
     9e2:	e8 e7 31 00 00       	call   3bce <wait>
  wait();
     9e7:	e8 e2 31 00 00       	call   3bce <wait>
  wait();
     9ec:	e8 dd 31 00 00       	call   3bce <wait>
  printf(1, "preempt ok\n");
     9f1:	83 ec 08             	sub    $0x8,%esp
     9f4:	68 d5 44 00 00       	push   $0x44d5
     9f9:	6a 01                	push   $0x1
     9fb:	e8 48 33 00 00       	call   3d48 <printf>
     a00:	83 c4 10             	add    $0x10,%esp
}
     a03:	c9                   	leave  
     a04:	c3                   	ret    

00000a05 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     a05:	55                   	push   %ebp
     a06:	89 e5                	mov    %esp,%ebp
     a08:	83 ec 18             	sub    $0x18,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     a0b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     a12:	eb 4e                	jmp    a62 <exitwait+0x5d>
    pid = fork();
     a14:	e8 a5 31 00 00       	call   3bbe <fork>
     a19:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     a1c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a20:	79 14                	jns    a36 <exitwait+0x31>
      printf(1, "fork failed\n");
     a22:	83 ec 08             	sub    $0x8,%esp
     a25:	68 e1 44 00 00       	push   $0x44e1
     a2a:	6a 01                	push   $0x1
     a2c:	e8 17 33 00 00       	call   3d48 <printf>
     a31:	83 c4 10             	add    $0x10,%esp
      return;
     a34:	eb 44                	jmp    a7a <exitwait+0x75>
    }
    if(pid){
     a36:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a3a:	74 1e                	je     a5a <exitwait+0x55>
      if(wait() != pid){
     a3c:	e8 8d 31 00 00       	call   3bce <wait>
     a41:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     a44:	74 19                	je     a5f <exitwait+0x5a>
        printf(1, "wait wrong pid\n");
     a46:	83 ec 08             	sub    $0x8,%esp
     a49:	68 ee 44 00 00       	push   $0x44ee
     a4e:	6a 01                	push   $0x1
     a50:	e8 f3 32 00 00       	call   3d48 <printf>
     a55:	83 c4 10             	add    $0x10,%esp
        return;
     a58:	eb 20                	jmp    a7a <exitwait+0x75>
      }
    } else {
      exit();
     a5a:	e8 67 31 00 00       	call   3bc6 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     a5f:	ff 45 f4             	incl   -0xc(%ebp)
     a62:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     a66:	7e ac                	jle    a14 <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     a68:	83 ec 08             	sub    $0x8,%esp
     a6b:	68 fe 44 00 00       	push   $0x44fe
     a70:	6a 01                	push   $0x1
     a72:	e8 d1 32 00 00       	call   3d48 <printf>
     a77:	83 c4 10             	add    $0x10,%esp
}
     a7a:	c9                   	leave  
     a7b:	c3                   	ret    

00000a7c <mem>:

void
mem(void)
{
     a7c:	55                   	push   %ebp
     a7d:	89 e5                	mov    %esp,%ebp
     a7f:	83 ec 18             	sub    $0x18,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     a82:	83 ec 08             	sub    $0x8,%esp
     a85:	68 0b 45 00 00       	push   $0x450b
     a8a:	6a 01                	push   $0x1
     a8c:	e8 b7 32 00 00       	call   3d48 <printf>
     a91:	83 c4 10             	add    $0x10,%esp
  ppid = getpid();
     a94:	e8 ad 31 00 00       	call   3c46 <getpid>
     a99:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     a9c:	e8 1d 31 00 00       	call   3bbe <fork>
     aa1:	89 45 ec             	mov    %eax,-0x14(%ebp)
     aa4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     aa8:	0f 85 b7 00 00 00    	jne    b65 <mem+0xe9>
    m1 = 0;
     aae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     ab5:	eb 0e                	jmp    ac5 <mem+0x49>
      *(char**)m2 = m1;
     ab7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     aba:	8b 55 f4             	mov    -0xc(%ebp),%edx
     abd:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     abf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ac2:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     ac5:	83 ec 0c             	sub    $0xc,%esp
     ac8:	68 11 27 00 00       	push   $0x2711
     acd:	e8 41 35 00 00       	call   4013 <malloc>
     ad2:	83 c4 10             	add    $0x10,%esp
     ad5:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ad8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     adc:	75 d9                	jne    ab7 <mem+0x3b>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ade:	eb 1c                	jmp    afc <mem+0x80>
      m2 = *(char**)m1;
     ae0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ae3:	8b 00                	mov    (%eax),%eax
     ae5:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     ae8:	83 ec 0c             	sub    $0xc,%esp
     aeb:	ff 75 f4             	pushl  -0xc(%ebp)
     aee:	e8 df 33 00 00       	call   3ed2 <free>
     af3:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     af6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     af9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     afc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b00:	75 de                	jne    ae0 <mem+0x64>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     b02:	83 ec 0c             	sub    $0xc,%esp
     b05:	68 00 50 00 00       	push   $0x5000
     b0a:	e8 04 35 00 00       	call   4013 <malloc>
     b0f:	83 c4 10             	add    $0x10,%esp
     b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     b15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b19:	75 25                	jne    b40 <mem+0xc4>
      printf(1, "couldn't allocate mem?!!\n");
     b1b:	83 ec 08             	sub    $0x8,%esp
     b1e:	68 15 45 00 00       	push   $0x4515
     b23:	6a 01                	push   $0x1
     b25:	e8 1e 32 00 00       	call   3d48 <printf>
     b2a:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 f0             	pushl  -0x10(%ebp)
     b33:	e8 be 30 00 00       	call   3bf6 <kill>
     b38:	83 c4 10             	add    $0x10,%esp
      exit();
     b3b:	e8 86 30 00 00       	call   3bc6 <exit>
    }
    free(m1);
     b40:	83 ec 0c             	sub    $0xc,%esp
     b43:	ff 75 f4             	pushl  -0xc(%ebp)
     b46:	e8 87 33 00 00       	call   3ed2 <free>
     b4b:	83 c4 10             	add    $0x10,%esp
    printf(1, "mem ok\n");
     b4e:	83 ec 08             	sub    $0x8,%esp
     b51:	68 2f 45 00 00       	push   $0x452f
     b56:	6a 01                	push   $0x1
     b58:	e8 eb 31 00 00       	call   3d48 <printf>
     b5d:	83 c4 10             	add    $0x10,%esp
    exit();
     b60:	e8 61 30 00 00       	call   3bc6 <exit>
  } else {
    wait();
     b65:	e8 64 30 00 00       	call   3bce <wait>
  }
}
     b6a:	c9                   	leave  
     b6b:	c3                   	ret    

00000b6c <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     b6c:	55                   	push   %ebp
     b6d:	89 e5                	mov    %esp,%ebp
     b6f:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     b72:	83 ec 08             	sub    $0x8,%esp
     b75:	68 37 45 00 00       	push   $0x4537
     b7a:	6a 01                	push   $0x1
     b7c:	e8 c7 31 00 00       	call   3d48 <printf>
     b81:	83 c4 10             	add    $0x10,%esp

  unlink("sharedfd");
     b84:	83 ec 0c             	sub    $0xc,%esp
     b87:	68 46 45 00 00       	push   $0x4546
     b8c:	e8 85 30 00 00       	call   3c16 <unlink>
     b91:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", O_CREATE|O_RDWR);
     b94:	83 ec 08             	sub    $0x8,%esp
     b97:	68 02 02 00 00       	push   $0x202
     b9c:	68 46 45 00 00       	push   $0x4546
     ba1:	e8 60 30 00 00       	call   3c06 <open>
     ba6:	83 c4 10             	add    $0x10,%esp
     ba9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     bac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bb0:	79 17                	jns    bc9 <sharedfd+0x5d>
    printf(1, "fstests: cannot open sharedfd for writing");
     bb2:	83 ec 08             	sub    $0x8,%esp
     bb5:	68 50 45 00 00       	push   $0x4550
     bba:	6a 01                	push   $0x1
     bbc:	e8 87 31 00 00       	call   3d48 <printf>
     bc1:	83 c4 10             	add    $0x10,%esp
    return;
     bc4:	e9 7e 01 00 00       	jmp    d47 <sharedfd+0x1db>
  }
  pid = fork();
     bc9:	e8 f0 2f 00 00       	call   3bbe <fork>
     bce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     bd1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     bd5:	75 07                	jne    bde <sharedfd+0x72>
     bd7:	b8 63 00 00 00       	mov    $0x63,%eax
     bdc:	eb 05                	jmp    be3 <sharedfd+0x77>
     bde:	b8 70 00 00 00       	mov    $0x70,%eax
     be3:	83 ec 04             	sub    $0x4,%esp
     be6:	6a 0a                	push   $0xa
     be8:	50                   	push   %eax
     be9:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bec:	50                   	push   %eax
     bed:	e8 46 2e 00 00       	call   3a38 <memset>
     bf2:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 1000; i++){
     bf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     bfc:	eb 30                	jmp    c2e <sharedfd+0xc2>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     bfe:	83 ec 04             	sub    $0x4,%esp
     c01:	6a 0a                	push   $0xa
     c03:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     c06:	50                   	push   %eax
     c07:	ff 75 e8             	pushl  -0x18(%ebp)
     c0a:	e8 d7 2f 00 00       	call   3be6 <write>
     c0f:	83 c4 10             	add    $0x10,%esp
     c12:	83 f8 0a             	cmp    $0xa,%eax
     c15:	74 14                	je     c2b <sharedfd+0xbf>
      printf(1, "fstests: write sharedfd failed\n");
     c17:	83 ec 08             	sub    $0x8,%esp
     c1a:	68 7c 45 00 00       	push   $0x457c
     c1f:	6a 01                	push   $0x1
     c21:	e8 22 31 00 00       	call   3d48 <printf>
     c26:	83 c4 10             	add    $0x10,%esp
      break;
     c29:	eb 0c                	jmp    c37 <sharedfd+0xcb>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     c2b:	ff 45 f4             	incl   -0xc(%ebp)
     c2e:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     c35:	7e c7                	jle    bfe <sharedfd+0x92>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     c37:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     c3b:	75 05                	jne    c42 <sharedfd+0xd6>
    exit();
     c3d:	e8 84 2f 00 00       	call   3bc6 <exit>
  else
    wait();
     c42:	e8 87 2f 00 00       	call   3bce <wait>
  close(fd);
     c47:	83 ec 0c             	sub    $0xc,%esp
     c4a:	ff 75 e8             	pushl  -0x18(%ebp)
     c4d:	e8 9c 2f 00 00       	call   3bee <close>
     c52:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     c55:	83 ec 08             	sub    $0x8,%esp
     c58:	6a 00                	push   $0x0
     c5a:	68 46 45 00 00       	push   $0x4546
     c5f:	e8 a2 2f 00 00       	call   3c06 <open>
     c64:	83 c4 10             	add    $0x10,%esp
     c67:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     c6a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     c6e:	79 17                	jns    c87 <sharedfd+0x11b>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     c70:	83 ec 08             	sub    $0x8,%esp
     c73:	68 9c 45 00 00       	push   $0x459c
     c78:	6a 01                	push   $0x1
     c7a:	e8 c9 30 00 00       	call   3d48 <printf>
     c7f:	83 c4 10             	add    $0x10,%esp
    return;
     c82:	e9 c0 00 00 00       	jmp    d47 <sharedfd+0x1db>
  }
  nc = np = 0;
     c87:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     c8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c91:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     c94:	eb 36                	jmp    ccc <sharedfd+0x160>
    for(i = 0; i < sizeof(buf); i++){
     c96:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c9d:	eb 25                	jmp    cc4 <sharedfd+0x158>
      if(buf[i] == 'c')
     c9f:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca5:	01 d0                	add    %edx,%eax
     ca7:	8a 00                	mov    (%eax),%al
     ca9:	3c 63                	cmp    $0x63,%al
     cab:	75 03                	jne    cb0 <sharedfd+0x144>
        nc++;
     cad:	ff 45 f0             	incl   -0x10(%ebp)
      if(buf[i] == 'p')
     cb0:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     cb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cb6:	01 d0                	add    %edx,%eax
     cb8:	8a 00                	mov    (%eax),%al
     cba:	3c 70                	cmp    $0x70,%al
     cbc:	75 03                	jne    cc1 <sharedfd+0x155>
        np++;
     cbe:	ff 45 ec             	incl   -0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     cc1:	ff 45 f4             	incl   -0xc(%ebp)
     cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc7:	83 f8 09             	cmp    $0x9,%eax
     cca:	76 d3                	jbe    c9f <sharedfd+0x133>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     ccc:	83 ec 04             	sub    $0x4,%esp
     ccf:	6a 0a                	push   $0xa
     cd1:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     cd4:	50                   	push   %eax
     cd5:	ff 75 e8             	pushl  -0x18(%ebp)
     cd8:	e8 01 2f 00 00       	call   3bde <read>
     cdd:	83 c4 10             	add    $0x10,%esp
     ce0:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ce3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ce7:	7f ad                	jg     c96 <sharedfd+0x12a>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     ce9:	83 ec 0c             	sub    $0xc,%esp
     cec:	ff 75 e8             	pushl  -0x18(%ebp)
     cef:	e8 fa 2e 00 00       	call   3bee <close>
     cf4:	83 c4 10             	add    $0x10,%esp
  unlink("sharedfd");
     cf7:	83 ec 0c             	sub    $0xc,%esp
     cfa:	68 46 45 00 00       	push   $0x4546
     cff:	e8 12 2f 00 00       	call   3c16 <unlink>
     d04:	83 c4 10             	add    $0x10,%esp
  if(nc == 10000 && np == 10000){
     d07:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     d0e:	75 1d                	jne    d2d <sharedfd+0x1c1>
     d10:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
     d17:	75 14                	jne    d2d <sharedfd+0x1c1>
    printf(1, "sharedfd ok\n");
     d19:	83 ec 08             	sub    $0x8,%esp
     d1c:	68 c7 45 00 00       	push   $0x45c7
     d21:	6a 01                	push   $0x1
     d23:	e8 20 30 00 00       	call   3d48 <printf>
     d28:	83 c4 10             	add    $0x10,%esp
     d2b:	eb 1a                	jmp    d47 <sharedfd+0x1db>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     d2d:	ff 75 ec             	pushl  -0x14(%ebp)
     d30:	ff 75 f0             	pushl  -0x10(%ebp)
     d33:	68 d4 45 00 00       	push   $0x45d4
     d38:	6a 01                	push   $0x1
     d3a:	e8 09 30 00 00       	call   3d48 <printf>
     d3f:	83 c4 10             	add    $0x10,%esp
    exit();
     d42:	e8 7f 2e 00 00       	call   3bc6 <exit>
  }
}
     d47:	c9                   	leave  
     d48:	c3                   	ret    

00000d49 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     d49:	55                   	push   %ebp
     d4a:	89 e5                	mov    %esp,%ebp
     d4c:	83 ec 28             	sub    $0x28,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     d4f:	83 ec 08             	sub    $0x8,%esp
     d52:	68 e9 45 00 00       	push   $0x45e9
     d57:	6a 01                	push   $0x1
     d59:	e8 ea 2f 00 00       	call   3d48 <printf>
     d5e:	83 c4 10             	add    $0x10,%esp

  unlink("f1");
     d61:	83 ec 0c             	sub    $0xc,%esp
     d64:	68 f8 45 00 00       	push   $0x45f8
     d69:	e8 a8 2e 00 00       	call   3c16 <unlink>
     d6e:	83 c4 10             	add    $0x10,%esp
  unlink("f2");
     d71:	83 ec 0c             	sub    $0xc,%esp
     d74:	68 fb 45 00 00       	push   $0x45fb
     d79:	e8 98 2e 00 00       	call   3c16 <unlink>
     d7e:	83 c4 10             	add    $0x10,%esp

  pid = fork();
     d81:	e8 38 2e 00 00       	call   3bbe <fork>
     d86:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
     d89:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d8d:	79 17                	jns    da6 <twofiles+0x5d>
    printf(1, "fork failed\n");
     d8f:	83 ec 08             	sub    $0x8,%esp
     d92:	68 e1 44 00 00       	push   $0x44e1
     d97:	6a 01                	push   $0x1
     d99:	e8 aa 2f 00 00       	call   3d48 <printf>
     d9e:	83 c4 10             	add    $0x10,%esp
    exit();
     da1:	e8 20 2e 00 00       	call   3bc6 <exit>
  }

  fname = pid ? "f1" : "f2";
     da6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     daa:	74 07                	je     db3 <twofiles+0x6a>
     dac:	b8 f8 45 00 00       	mov    $0x45f8,%eax
     db1:	eb 05                	jmp    db8 <twofiles+0x6f>
     db3:	b8 fb 45 00 00       	mov    $0x45fb,%eax
     db8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     dbb:	83 ec 08             	sub    $0x8,%esp
     dbe:	68 02 02 00 00       	push   $0x202
     dc3:	ff 75 e4             	pushl  -0x1c(%ebp)
     dc6:	e8 3b 2e 00 00       	call   3c06 <open>
     dcb:	83 c4 10             	add    $0x10,%esp
     dce:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     dd1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     dd5:	79 17                	jns    dee <twofiles+0xa5>
    printf(1, "create failed\n");
     dd7:	83 ec 08             	sub    $0x8,%esp
     dda:	68 fe 45 00 00       	push   $0x45fe
     ddf:	6a 01                	push   $0x1
     de1:	e8 62 2f 00 00       	call   3d48 <printf>
     de6:	83 c4 10             	add    $0x10,%esp
    exit();
     de9:	e8 d8 2d 00 00       	call   3bc6 <exit>
  }

  memset(buf, pid?'p':'c', 512);
     dee:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     df2:	74 07                	je     dfb <twofiles+0xb2>
     df4:	b8 70 00 00 00       	mov    $0x70,%eax
     df9:	eb 05                	jmp    e00 <twofiles+0xb7>
     dfb:	b8 63 00 00 00       	mov    $0x63,%eax
     e00:	83 ec 04             	sub    $0x4,%esp
     e03:	68 00 02 00 00       	push   $0x200
     e08:	50                   	push   %eax
     e09:	68 40 86 00 00       	push   $0x8640
     e0e:	e8 25 2c 00 00       	call   3a38 <memset>
     e13:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 12; i++){
     e16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e1d:	eb 41                	jmp    e60 <twofiles+0x117>
    if((n = write(fd, buf, 500)) != 500){
     e1f:	83 ec 04             	sub    $0x4,%esp
     e22:	68 f4 01 00 00       	push   $0x1f4
     e27:	68 40 86 00 00       	push   $0x8640
     e2c:	ff 75 e0             	pushl  -0x20(%ebp)
     e2f:	e8 b2 2d 00 00       	call   3be6 <write>
     e34:	83 c4 10             	add    $0x10,%esp
     e37:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e3a:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
     e41:	74 1a                	je     e5d <twofiles+0x114>
      printf(1, "write failed %d\n", n);
     e43:	83 ec 04             	sub    $0x4,%esp
     e46:	ff 75 dc             	pushl  -0x24(%ebp)
     e49:	68 0d 46 00 00       	push   $0x460d
     e4e:	6a 01                	push   $0x1
     e50:	e8 f3 2e 00 00       	call   3d48 <printf>
     e55:	83 c4 10             	add    $0x10,%esp
      exit();
     e58:	e8 69 2d 00 00       	call   3bc6 <exit>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     e5d:	ff 45 f4             	incl   -0xc(%ebp)
     e60:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
     e64:	7e b9                	jle    e1f <twofiles+0xd6>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     e66:	83 ec 0c             	sub    $0xc,%esp
     e69:	ff 75 e0             	pushl  -0x20(%ebp)
     e6c:	e8 7d 2d 00 00       	call   3bee <close>
     e71:	83 c4 10             	add    $0x10,%esp
  if(pid)
     e74:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e78:	74 11                	je     e8b <twofiles+0x142>
    wait();
     e7a:	e8 4f 2d 00 00       	call   3bce <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
     e7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e86:	e9 da 00 00 00       	jmp    f65 <twofiles+0x21c>
  }
  close(fd);
  if(pid)
    wait();
  else
    exit();
     e8b:	e8 36 2d 00 00       	call   3bc6 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     e90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e94:	74 07                	je     e9d <twofiles+0x154>
     e96:	b8 f8 45 00 00       	mov    $0x45f8,%eax
     e9b:	eb 05                	jmp    ea2 <twofiles+0x159>
     e9d:	b8 fb 45 00 00       	mov    $0x45fb,%eax
     ea2:	83 ec 08             	sub    $0x8,%esp
     ea5:	6a 00                	push   $0x0
     ea7:	50                   	push   %eax
     ea8:	e8 59 2d 00 00       	call   3c06 <open>
     ead:	83 c4 10             	add    $0x10,%esp
     eb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
     eb3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     eba:	eb 54                	jmp    f10 <twofiles+0x1c7>
      for(j = 0; j < n; j++){
     ebc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ec3:	eb 3d                	jmp    f02 <twofiles+0x1b9>
        if(buf[j] != (i?'p':'c')){
     ec5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ec8:	05 40 86 00 00       	add    $0x8640,%eax
     ecd:	8a 00                	mov    (%eax),%al
     ecf:	0f be d0             	movsbl %al,%edx
     ed2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ed6:	74 07                	je     edf <twofiles+0x196>
     ed8:	b8 70 00 00 00       	mov    $0x70,%eax
     edd:	eb 05                	jmp    ee4 <twofiles+0x19b>
     edf:	b8 63 00 00 00       	mov    $0x63,%eax
     ee4:	39 c2                	cmp    %eax,%edx
     ee6:	74 17                	je     eff <twofiles+0x1b6>
          printf(1, "wrong char\n");
     ee8:	83 ec 08             	sub    $0x8,%esp
     eeb:	68 1e 46 00 00       	push   $0x461e
     ef0:	6a 01                	push   $0x1
     ef2:	e8 51 2e 00 00       	call   3d48 <printf>
     ef7:	83 c4 10             	add    $0x10,%esp
          exit();
     efa:	e8 c7 2c 00 00       	call   3bc6 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     eff:	ff 45 f0             	incl   -0x10(%ebp)
     f02:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f05:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     f08:	7c bb                	jl     ec5 <twofiles+0x17c>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     f0a:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f0d:	01 45 ec             	add    %eax,-0x14(%ebp)
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f10:	83 ec 04             	sub    $0x4,%esp
     f13:	68 00 20 00 00       	push   $0x2000
     f18:	68 40 86 00 00       	push   $0x8640
     f1d:	ff 75 e0             	pushl  -0x20(%ebp)
     f20:	e8 b9 2c 00 00       	call   3bde <read>
     f25:	83 c4 10             	add    $0x10,%esp
     f28:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f2b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     f2f:	7f 8b                	jg     ebc <twofiles+0x173>
          exit();
        }
      }
      total += n;
    }
    close(fd);
     f31:	83 ec 0c             	sub    $0xc,%esp
     f34:	ff 75 e0             	pushl  -0x20(%ebp)
     f37:	e8 b2 2c 00 00       	call   3bee <close>
     f3c:	83 c4 10             	add    $0x10,%esp
    if(total != 12*500){
     f3f:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
     f46:	74 1a                	je     f62 <twofiles+0x219>
      printf(1, "wrong length %d\n", total);
     f48:	83 ec 04             	sub    $0x4,%esp
     f4b:	ff 75 ec             	pushl  -0x14(%ebp)
     f4e:	68 2a 46 00 00       	push   $0x462a
     f53:	6a 01                	push   $0x1
     f55:	e8 ee 2d 00 00       	call   3d48 <printf>
     f5a:	83 c4 10             	add    $0x10,%esp
      exit();
     f5d:	e8 64 2c 00 00       	call   3bc6 <exit>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     f62:	ff 45 f4             	incl   -0xc(%ebp)
     f65:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
     f69:	0f 8e 21 ff ff ff    	jle    e90 <twofiles+0x147>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     f6f:	83 ec 0c             	sub    $0xc,%esp
     f72:	68 f8 45 00 00       	push   $0x45f8
     f77:	e8 9a 2c 00 00       	call   3c16 <unlink>
     f7c:	83 c4 10             	add    $0x10,%esp
  unlink("f2");
     f7f:	83 ec 0c             	sub    $0xc,%esp
     f82:	68 fb 45 00 00       	push   $0x45fb
     f87:	e8 8a 2c 00 00       	call   3c16 <unlink>
     f8c:	83 c4 10             	add    $0x10,%esp

  printf(1, "twofiles ok\n");
     f8f:	83 ec 08             	sub    $0x8,%esp
     f92:	68 3b 46 00 00       	push   $0x463b
     f97:	6a 01                	push   $0x1
     f99:	e8 aa 2d 00 00       	call   3d48 <printf>
     f9e:	83 c4 10             	add    $0x10,%esp
}
     fa1:	c9                   	leave  
     fa2:	c3                   	ret    

00000fa3 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
     fa3:	55                   	push   %ebp
     fa4:	89 e5                	mov    %esp,%ebp
     fa6:	83 ec 38             	sub    $0x38,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     fa9:	83 ec 08             	sub    $0x8,%esp
     fac:	68 48 46 00 00       	push   $0x4648
     fb1:	6a 01                	push   $0x1
     fb3:	e8 90 2d 00 00       	call   3d48 <printf>
     fb8:	83 c4 10             	add    $0x10,%esp
  pid = fork();
     fbb:	e8 fe 2b 00 00       	call   3bbe <fork>
     fc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid < 0){
     fc3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fc7:	79 17                	jns    fe0 <createdelete+0x3d>
    printf(1, "fork failed\n");
     fc9:	83 ec 08             	sub    $0x8,%esp
     fcc:	68 e1 44 00 00       	push   $0x44e1
     fd1:	6a 01                	push   $0x1
     fd3:	e8 70 2d 00 00       	call   3d48 <printf>
     fd8:	83 c4 10             	add    $0x10,%esp
    exit();
     fdb:	e8 e6 2b 00 00       	call   3bc6 <exit>
  }

  name[0] = pid ? 'p' : 'c';
     fe0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fe4:	74 04                	je     fea <createdelete+0x47>
     fe6:	b0 70                	mov    $0x70,%al
     fe8:	eb 02                	jmp    fec <createdelete+0x49>
     fea:	b0 63                	mov    $0x63,%al
     fec:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
     fef:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
     ff3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ffa:	e9 9a 00 00 00       	jmp    1099 <createdelete+0xf6>
    name[1] = '0' + i;
     fff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1002:	83 c0 30             	add    $0x30,%eax
    1005:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    1008:	83 ec 08             	sub    $0x8,%esp
    100b:	68 02 02 00 00       	push   $0x202
    1010:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1013:	50                   	push   %eax
    1014:	e8 ed 2b 00 00       	call   3c06 <open>
    1019:	83 c4 10             	add    $0x10,%esp
    101c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    101f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1023:	79 17                	jns    103c <createdelete+0x99>
      printf(1, "create failed\n");
    1025:	83 ec 08             	sub    $0x8,%esp
    1028:	68 fe 45 00 00       	push   $0x45fe
    102d:	6a 01                	push   $0x1
    102f:	e8 14 2d 00 00       	call   3d48 <printf>
    1034:	83 c4 10             	add    $0x10,%esp
      exit();
    1037:	e8 8a 2b 00 00       	call   3bc6 <exit>
    }
    close(fd);
    103c:	83 ec 0c             	sub    $0xc,%esp
    103f:	ff 75 ec             	pushl  -0x14(%ebp)
    1042:	e8 a7 2b 00 00       	call   3bee <close>
    1047:	83 c4 10             	add    $0x10,%esp
    if(i > 0 && (i % 2 ) == 0){
    104a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    104e:	7e 46                	jle    1096 <createdelete+0xf3>
    1050:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1053:	83 e0 01             	and    $0x1,%eax
    1056:	85 c0                	test   %eax,%eax
    1058:	75 3c                	jne    1096 <createdelete+0xf3>
      name[1] = '0' + (i / 2);
    105a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    105d:	89 c2                	mov    %eax,%edx
    105f:	c1 ea 1f             	shr    $0x1f,%edx
    1062:	01 d0                	add    %edx,%eax
    1064:	d1 f8                	sar    %eax
    1066:	83 c0 30             	add    $0x30,%eax
    1069:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    106c:	83 ec 0c             	sub    $0xc,%esp
    106f:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1072:	50                   	push   %eax
    1073:	e8 9e 2b 00 00       	call   3c16 <unlink>
    1078:	83 c4 10             	add    $0x10,%esp
    107b:	85 c0                	test   %eax,%eax
    107d:	79 17                	jns    1096 <createdelete+0xf3>
        printf(1, "unlink failed\n");
    107f:	83 ec 08             	sub    $0x8,%esp
    1082:	68 5b 46 00 00       	push   $0x465b
    1087:	6a 01                	push   $0x1
    1089:	e8 ba 2c 00 00       	call   3d48 <printf>
    108e:	83 c4 10             	add    $0x10,%esp
        exit();
    1091:	e8 30 2b 00 00       	call   3bc6 <exit>
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    1096:	ff 45 f4             	incl   -0xc(%ebp)
    1099:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    109d:	0f 8e 5c ff ff ff    	jle    fff <createdelete+0x5c>
        exit();
      }
    }
  }

  if(pid==0)
    10a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10a7:	75 05                	jne    10ae <createdelete+0x10b>
    exit();
    10a9:	e8 18 2b 00 00       	call   3bc6 <exit>
  else
    wait();
    10ae:	e8 1b 2b 00 00       	call   3bce <wait>

  for(i = 0; i < N; i++){
    10b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10ba:	e9 21 01 00 00       	jmp    11e0 <createdelete+0x23d>
    name[0] = 'p';
    10bf:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    10c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c6:	83 c0 30             	add    $0x30,%eax
    10c9:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    10cc:	83 ec 08             	sub    $0x8,%esp
    10cf:	6a 00                	push   $0x0
    10d1:	8d 45 cc             	lea    -0x34(%ebp),%eax
    10d4:	50                   	push   %eax
    10d5:	e8 2c 2b 00 00       	call   3c06 <open>
    10da:	83 c4 10             	add    $0x10,%esp
    10dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    10e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10e4:	74 06                	je     10ec <createdelete+0x149>
    10e6:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    10ea:	7e 21                	jle    110d <createdelete+0x16a>
    10ec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10f0:	79 1b                	jns    110d <createdelete+0x16a>
      printf(1, "oops createdelete %s didn't exist\n", name);
    10f2:	83 ec 04             	sub    $0x4,%esp
    10f5:	8d 45 cc             	lea    -0x34(%ebp),%eax
    10f8:	50                   	push   %eax
    10f9:	68 6c 46 00 00       	push   $0x466c
    10fe:	6a 01                	push   $0x1
    1100:	e8 43 2c 00 00       	call   3d48 <printf>
    1105:	83 c4 10             	add    $0x10,%esp
      exit();
    1108:	e8 b9 2a 00 00       	call   3bc6 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    110d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1111:	7e 27                	jle    113a <createdelete+0x197>
    1113:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1117:	7f 21                	jg     113a <createdelete+0x197>
    1119:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    111d:	78 1b                	js     113a <createdelete+0x197>
      printf(1, "oops createdelete %s did exist\n", name);
    111f:	83 ec 04             	sub    $0x4,%esp
    1122:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1125:	50                   	push   %eax
    1126:	68 90 46 00 00       	push   $0x4690
    112b:	6a 01                	push   $0x1
    112d:	e8 16 2c 00 00       	call   3d48 <printf>
    1132:	83 c4 10             	add    $0x10,%esp
      exit();
    1135:	e8 8c 2a 00 00       	call   3bc6 <exit>
    }
    if(fd >= 0)
    113a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    113e:	78 0e                	js     114e <createdelete+0x1ab>
      close(fd);
    1140:	83 ec 0c             	sub    $0xc,%esp
    1143:	ff 75 ec             	pushl  -0x14(%ebp)
    1146:	e8 a3 2a 00 00       	call   3bee <close>
    114b:	83 c4 10             	add    $0x10,%esp

    name[0] = 'c';
    114e:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    1152:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1155:	83 c0 30             	add    $0x30,%eax
    1158:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    115b:	83 ec 08             	sub    $0x8,%esp
    115e:	6a 00                	push   $0x0
    1160:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1163:	50                   	push   %eax
    1164:	e8 9d 2a 00 00       	call   3c06 <open>
    1169:	83 c4 10             	add    $0x10,%esp
    116c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    116f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1173:	74 06                	je     117b <createdelete+0x1d8>
    1175:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1179:	7e 21                	jle    119c <createdelete+0x1f9>
    117b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    117f:	79 1b                	jns    119c <createdelete+0x1f9>
      printf(1, "oops createdelete %s didn't exist\n", name);
    1181:	83 ec 04             	sub    $0x4,%esp
    1184:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1187:	50                   	push   %eax
    1188:	68 6c 46 00 00       	push   $0x466c
    118d:	6a 01                	push   $0x1
    118f:	e8 b4 2b 00 00       	call   3d48 <printf>
    1194:	83 c4 10             	add    $0x10,%esp
      exit();
    1197:	e8 2a 2a 00 00       	call   3bc6 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    119c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11a0:	7e 27                	jle    11c9 <createdelete+0x226>
    11a2:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11a6:	7f 21                	jg     11c9 <createdelete+0x226>
    11a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11ac:	78 1b                	js     11c9 <createdelete+0x226>
      printf(1, "oops createdelete %s did exist\n", name);
    11ae:	83 ec 04             	sub    $0x4,%esp
    11b1:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11b4:	50                   	push   %eax
    11b5:	68 90 46 00 00       	push   $0x4690
    11ba:	6a 01                	push   $0x1
    11bc:	e8 87 2b 00 00       	call   3d48 <printf>
    11c1:	83 c4 10             	add    $0x10,%esp
      exit();
    11c4:	e8 fd 29 00 00       	call   3bc6 <exit>
    }
    if(fd >= 0)
    11c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11cd:	78 0e                	js     11dd <createdelete+0x23a>
      close(fd);
    11cf:	83 ec 0c             	sub    $0xc,%esp
    11d2:	ff 75 ec             	pushl  -0x14(%ebp)
    11d5:	e8 14 2a 00 00       	call   3bee <close>
    11da:	83 c4 10             	add    $0x10,%esp
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    11dd:	ff 45 f4             	incl   -0xc(%ebp)
    11e0:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    11e4:	0f 8e d5 fe ff ff    	jle    10bf <createdelete+0x11c>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    11ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11f1:	eb 32                	jmp    1225 <createdelete+0x282>
    name[0] = 'p';
    11f3:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    11f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fa:	83 c0 30             	add    $0x30,%eax
    11fd:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    1200:	83 ec 0c             	sub    $0xc,%esp
    1203:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1206:	50                   	push   %eax
    1207:	e8 0a 2a 00 00       	call   3c16 <unlink>
    120c:	83 c4 10             	add    $0x10,%esp
    name[0] = 'c';
    120f:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    1213:	83 ec 0c             	sub    $0xc,%esp
    1216:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1219:	50                   	push   %eax
    121a:	e8 f7 29 00 00       	call   3c16 <unlink>
    121f:	83 c4 10             	add    $0x10,%esp
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    1222:	ff 45 f4             	incl   -0xc(%ebp)
    1225:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1229:	7e c8                	jle    11f3 <createdelete+0x250>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    122b:	83 ec 08             	sub    $0x8,%esp
    122e:	68 b0 46 00 00       	push   $0x46b0
    1233:	6a 01                	push   $0x1
    1235:	e8 0e 2b 00 00       	call   3d48 <printf>
    123a:	83 c4 10             	add    $0x10,%esp
}
    123d:	c9                   	leave  
    123e:	c3                   	ret    

0000123f <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    123f:	55                   	push   %ebp
    1240:	89 e5                	mov    %esp,%ebp
    1242:	83 ec 18             	sub    $0x18,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1245:	83 ec 08             	sub    $0x8,%esp
    1248:	68 c1 46 00 00       	push   $0x46c1
    124d:	6a 01                	push   $0x1
    124f:	e8 f4 2a 00 00       	call   3d48 <printf>
    1254:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1257:	83 ec 08             	sub    $0x8,%esp
    125a:	68 02 02 00 00       	push   $0x202
    125f:	68 d2 46 00 00       	push   $0x46d2
    1264:	e8 9d 29 00 00       	call   3c06 <open>
    1269:	83 c4 10             	add    $0x10,%esp
    126c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    126f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1273:	79 17                	jns    128c <unlinkread+0x4d>
    printf(1, "create unlinkread failed\n");
    1275:	83 ec 08             	sub    $0x8,%esp
    1278:	68 dd 46 00 00       	push   $0x46dd
    127d:	6a 01                	push   $0x1
    127f:	e8 c4 2a 00 00       	call   3d48 <printf>
    1284:	83 c4 10             	add    $0x10,%esp
    exit();
    1287:	e8 3a 29 00 00       	call   3bc6 <exit>
  }
  write(fd, "hello", 5);
    128c:	83 ec 04             	sub    $0x4,%esp
    128f:	6a 05                	push   $0x5
    1291:	68 f7 46 00 00       	push   $0x46f7
    1296:	ff 75 f4             	pushl  -0xc(%ebp)
    1299:	e8 48 29 00 00       	call   3be6 <write>
    129e:	83 c4 10             	add    $0x10,%esp
  close(fd);
    12a1:	83 ec 0c             	sub    $0xc,%esp
    12a4:	ff 75 f4             	pushl  -0xc(%ebp)
    12a7:	e8 42 29 00 00       	call   3bee <close>
    12ac:	83 c4 10             	add    $0x10,%esp

  fd = open("unlinkread", O_RDWR);
    12af:	83 ec 08             	sub    $0x8,%esp
    12b2:	6a 02                	push   $0x2
    12b4:	68 d2 46 00 00       	push   $0x46d2
    12b9:	e8 48 29 00 00       	call   3c06 <open>
    12be:	83 c4 10             	add    $0x10,%esp
    12c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    12c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12c8:	79 17                	jns    12e1 <unlinkread+0xa2>
    printf(1, "open unlinkread failed\n");
    12ca:	83 ec 08             	sub    $0x8,%esp
    12cd:	68 fd 46 00 00       	push   $0x46fd
    12d2:	6a 01                	push   $0x1
    12d4:	e8 6f 2a 00 00       	call   3d48 <printf>
    12d9:	83 c4 10             	add    $0x10,%esp
    exit();
    12dc:	e8 e5 28 00 00       	call   3bc6 <exit>
  }
  if(unlink("unlinkread") != 0){
    12e1:	83 ec 0c             	sub    $0xc,%esp
    12e4:	68 d2 46 00 00       	push   $0x46d2
    12e9:	e8 28 29 00 00       	call   3c16 <unlink>
    12ee:	83 c4 10             	add    $0x10,%esp
    12f1:	85 c0                	test   %eax,%eax
    12f3:	74 17                	je     130c <unlinkread+0xcd>
    printf(1, "unlink unlinkread failed\n");
    12f5:	83 ec 08             	sub    $0x8,%esp
    12f8:	68 15 47 00 00       	push   $0x4715
    12fd:	6a 01                	push   $0x1
    12ff:	e8 44 2a 00 00       	call   3d48 <printf>
    1304:	83 c4 10             	add    $0x10,%esp
    exit();
    1307:	e8 ba 28 00 00       	call   3bc6 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    130c:	83 ec 08             	sub    $0x8,%esp
    130f:	68 02 02 00 00       	push   $0x202
    1314:	68 d2 46 00 00       	push   $0x46d2
    1319:	e8 e8 28 00 00       	call   3c06 <open>
    131e:	83 c4 10             	add    $0x10,%esp
    1321:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1324:	83 ec 04             	sub    $0x4,%esp
    1327:	6a 03                	push   $0x3
    1329:	68 2f 47 00 00       	push   $0x472f
    132e:	ff 75 f0             	pushl  -0x10(%ebp)
    1331:	e8 b0 28 00 00       	call   3be6 <write>
    1336:	83 c4 10             	add    $0x10,%esp
  close(fd1);
    1339:	83 ec 0c             	sub    $0xc,%esp
    133c:	ff 75 f0             	pushl  -0x10(%ebp)
    133f:	e8 aa 28 00 00       	call   3bee <close>
    1344:	83 c4 10             	add    $0x10,%esp

  if(read(fd, buf, sizeof(buf)) != 5){
    1347:	83 ec 04             	sub    $0x4,%esp
    134a:	68 00 20 00 00       	push   $0x2000
    134f:	68 40 86 00 00       	push   $0x8640
    1354:	ff 75 f4             	pushl  -0xc(%ebp)
    1357:	e8 82 28 00 00       	call   3bde <read>
    135c:	83 c4 10             	add    $0x10,%esp
    135f:	83 f8 05             	cmp    $0x5,%eax
    1362:	74 17                	je     137b <unlinkread+0x13c>
    printf(1, "unlinkread read failed");
    1364:	83 ec 08             	sub    $0x8,%esp
    1367:	68 33 47 00 00       	push   $0x4733
    136c:	6a 01                	push   $0x1
    136e:	e8 d5 29 00 00       	call   3d48 <printf>
    1373:	83 c4 10             	add    $0x10,%esp
    exit();
    1376:	e8 4b 28 00 00       	call   3bc6 <exit>
  }
  if(buf[0] != 'h'){
    137b:	a0 40 86 00 00       	mov    0x8640,%al
    1380:	3c 68                	cmp    $0x68,%al
    1382:	74 17                	je     139b <unlinkread+0x15c>
    printf(1, "unlinkread wrong data\n");
    1384:	83 ec 08             	sub    $0x8,%esp
    1387:	68 4a 47 00 00       	push   $0x474a
    138c:	6a 01                	push   $0x1
    138e:	e8 b5 29 00 00       	call   3d48 <printf>
    1393:	83 c4 10             	add    $0x10,%esp
    exit();
    1396:	e8 2b 28 00 00       	call   3bc6 <exit>
  }
  if(write(fd, buf, 10) != 10){
    139b:	83 ec 04             	sub    $0x4,%esp
    139e:	6a 0a                	push   $0xa
    13a0:	68 40 86 00 00       	push   $0x8640
    13a5:	ff 75 f4             	pushl  -0xc(%ebp)
    13a8:	e8 39 28 00 00       	call   3be6 <write>
    13ad:	83 c4 10             	add    $0x10,%esp
    13b0:	83 f8 0a             	cmp    $0xa,%eax
    13b3:	74 17                	je     13cc <unlinkread+0x18d>
    printf(1, "unlinkread write failed\n");
    13b5:	83 ec 08             	sub    $0x8,%esp
    13b8:	68 61 47 00 00       	push   $0x4761
    13bd:	6a 01                	push   $0x1
    13bf:	e8 84 29 00 00       	call   3d48 <printf>
    13c4:	83 c4 10             	add    $0x10,%esp
    exit();
    13c7:	e8 fa 27 00 00       	call   3bc6 <exit>
  }
  close(fd);
    13cc:	83 ec 0c             	sub    $0xc,%esp
    13cf:	ff 75 f4             	pushl  -0xc(%ebp)
    13d2:	e8 17 28 00 00       	call   3bee <close>
    13d7:	83 c4 10             	add    $0x10,%esp
  unlink("unlinkread");
    13da:	83 ec 0c             	sub    $0xc,%esp
    13dd:	68 d2 46 00 00       	push   $0x46d2
    13e2:	e8 2f 28 00 00       	call   3c16 <unlink>
    13e7:	83 c4 10             	add    $0x10,%esp
  printf(1, "unlinkread ok\n");
    13ea:	83 ec 08             	sub    $0x8,%esp
    13ed:	68 7a 47 00 00       	push   $0x477a
    13f2:	6a 01                	push   $0x1
    13f4:	e8 4f 29 00 00       	call   3d48 <printf>
    13f9:	83 c4 10             	add    $0x10,%esp
}
    13fc:	c9                   	leave  
    13fd:	c3                   	ret    

000013fe <linktest>:

void
linktest(void)
{
    13fe:	55                   	push   %ebp
    13ff:	89 e5                	mov    %esp,%ebp
    1401:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "linktest\n");
    1404:	83 ec 08             	sub    $0x8,%esp
    1407:	68 89 47 00 00       	push   $0x4789
    140c:	6a 01                	push   $0x1
    140e:	e8 35 29 00 00       	call   3d48 <printf>
    1413:	83 c4 10             	add    $0x10,%esp

  unlink("lf1");
    1416:	83 ec 0c             	sub    $0xc,%esp
    1419:	68 93 47 00 00       	push   $0x4793
    141e:	e8 f3 27 00 00       	call   3c16 <unlink>
    1423:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    1426:	83 ec 0c             	sub    $0xc,%esp
    1429:	68 97 47 00 00       	push   $0x4797
    142e:	e8 e3 27 00 00       	call   3c16 <unlink>
    1433:	83 c4 10             	add    $0x10,%esp

  fd = open("lf1", O_CREATE|O_RDWR);
    1436:	83 ec 08             	sub    $0x8,%esp
    1439:	68 02 02 00 00       	push   $0x202
    143e:	68 93 47 00 00       	push   $0x4793
    1443:	e8 be 27 00 00       	call   3c06 <open>
    1448:	83 c4 10             	add    $0x10,%esp
    144b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    144e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1452:	79 17                	jns    146b <linktest+0x6d>
    printf(1, "create lf1 failed\n");
    1454:	83 ec 08             	sub    $0x8,%esp
    1457:	68 9b 47 00 00       	push   $0x479b
    145c:	6a 01                	push   $0x1
    145e:	e8 e5 28 00 00       	call   3d48 <printf>
    1463:	83 c4 10             	add    $0x10,%esp
    exit();
    1466:	e8 5b 27 00 00       	call   3bc6 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    146b:	83 ec 04             	sub    $0x4,%esp
    146e:	6a 05                	push   $0x5
    1470:	68 f7 46 00 00       	push   $0x46f7
    1475:	ff 75 f4             	pushl  -0xc(%ebp)
    1478:	e8 69 27 00 00       	call   3be6 <write>
    147d:	83 c4 10             	add    $0x10,%esp
    1480:	83 f8 05             	cmp    $0x5,%eax
    1483:	74 17                	je     149c <linktest+0x9e>
    printf(1, "write lf1 failed\n");
    1485:	83 ec 08             	sub    $0x8,%esp
    1488:	68 ae 47 00 00       	push   $0x47ae
    148d:	6a 01                	push   $0x1
    148f:	e8 b4 28 00 00       	call   3d48 <printf>
    1494:	83 c4 10             	add    $0x10,%esp
    exit();
    1497:	e8 2a 27 00 00       	call   3bc6 <exit>
  }
  close(fd);
    149c:	83 ec 0c             	sub    $0xc,%esp
    149f:	ff 75 f4             	pushl  -0xc(%ebp)
    14a2:	e8 47 27 00 00       	call   3bee <close>
    14a7:	83 c4 10             	add    $0x10,%esp

  if(link("lf1", "lf2") < 0){
    14aa:	83 ec 08             	sub    $0x8,%esp
    14ad:	68 97 47 00 00       	push   $0x4797
    14b2:	68 93 47 00 00       	push   $0x4793
    14b7:	e8 6a 27 00 00       	call   3c26 <link>
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	85 c0                	test   %eax,%eax
    14c1:	79 17                	jns    14da <linktest+0xdc>
    printf(1, "link lf1 lf2 failed\n");
    14c3:	83 ec 08             	sub    $0x8,%esp
    14c6:	68 c0 47 00 00       	push   $0x47c0
    14cb:	6a 01                	push   $0x1
    14cd:	e8 76 28 00 00       	call   3d48 <printf>
    14d2:	83 c4 10             	add    $0x10,%esp
    exit();
    14d5:	e8 ec 26 00 00       	call   3bc6 <exit>
  }
  unlink("lf1");
    14da:	83 ec 0c             	sub    $0xc,%esp
    14dd:	68 93 47 00 00       	push   $0x4793
    14e2:	e8 2f 27 00 00       	call   3c16 <unlink>
    14e7:	83 c4 10             	add    $0x10,%esp

  if(open("lf1", 0) >= 0){
    14ea:	83 ec 08             	sub    $0x8,%esp
    14ed:	6a 00                	push   $0x0
    14ef:	68 93 47 00 00       	push   $0x4793
    14f4:	e8 0d 27 00 00       	call   3c06 <open>
    14f9:	83 c4 10             	add    $0x10,%esp
    14fc:	85 c0                	test   %eax,%eax
    14fe:	78 17                	js     1517 <linktest+0x119>
    printf(1, "unlinked lf1 but it is still there!\n");
    1500:	83 ec 08             	sub    $0x8,%esp
    1503:	68 d8 47 00 00       	push   $0x47d8
    1508:	6a 01                	push   $0x1
    150a:	e8 39 28 00 00       	call   3d48 <printf>
    150f:	83 c4 10             	add    $0x10,%esp
    exit();
    1512:	e8 af 26 00 00       	call   3bc6 <exit>
  }

  fd = open("lf2", 0);
    1517:	83 ec 08             	sub    $0x8,%esp
    151a:	6a 00                	push   $0x0
    151c:	68 97 47 00 00       	push   $0x4797
    1521:	e8 e0 26 00 00       	call   3c06 <open>
    1526:	83 c4 10             	add    $0x10,%esp
    1529:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    152c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1530:	79 17                	jns    1549 <linktest+0x14b>
    printf(1, "open lf2 failed\n");
    1532:	83 ec 08             	sub    $0x8,%esp
    1535:	68 fd 47 00 00       	push   $0x47fd
    153a:	6a 01                	push   $0x1
    153c:	e8 07 28 00 00       	call   3d48 <printf>
    1541:	83 c4 10             	add    $0x10,%esp
    exit();
    1544:	e8 7d 26 00 00       	call   3bc6 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1549:	83 ec 04             	sub    $0x4,%esp
    154c:	68 00 20 00 00       	push   $0x2000
    1551:	68 40 86 00 00       	push   $0x8640
    1556:	ff 75 f4             	pushl  -0xc(%ebp)
    1559:	e8 80 26 00 00       	call   3bde <read>
    155e:	83 c4 10             	add    $0x10,%esp
    1561:	83 f8 05             	cmp    $0x5,%eax
    1564:	74 17                	je     157d <linktest+0x17f>
    printf(1, "read lf2 failed\n");
    1566:	83 ec 08             	sub    $0x8,%esp
    1569:	68 0e 48 00 00       	push   $0x480e
    156e:	6a 01                	push   $0x1
    1570:	e8 d3 27 00 00       	call   3d48 <printf>
    1575:	83 c4 10             	add    $0x10,%esp
    exit();
    1578:	e8 49 26 00 00       	call   3bc6 <exit>
  }
  close(fd);
    157d:	83 ec 0c             	sub    $0xc,%esp
    1580:	ff 75 f4             	pushl  -0xc(%ebp)
    1583:	e8 66 26 00 00       	call   3bee <close>
    1588:	83 c4 10             	add    $0x10,%esp

  if(link("lf2", "lf2") >= 0){
    158b:	83 ec 08             	sub    $0x8,%esp
    158e:	68 97 47 00 00       	push   $0x4797
    1593:	68 97 47 00 00       	push   $0x4797
    1598:	e8 89 26 00 00       	call   3c26 <link>
    159d:	83 c4 10             	add    $0x10,%esp
    15a0:	85 c0                	test   %eax,%eax
    15a2:	78 17                	js     15bb <linktest+0x1bd>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15a4:	83 ec 08             	sub    $0x8,%esp
    15a7:	68 1f 48 00 00       	push   $0x481f
    15ac:	6a 01                	push   $0x1
    15ae:	e8 95 27 00 00       	call   3d48 <printf>
    15b3:	83 c4 10             	add    $0x10,%esp
    exit();
    15b6:	e8 0b 26 00 00       	call   3bc6 <exit>
  }

  unlink("lf2");
    15bb:	83 ec 0c             	sub    $0xc,%esp
    15be:	68 97 47 00 00       	push   $0x4797
    15c3:	e8 4e 26 00 00       	call   3c16 <unlink>
    15c8:	83 c4 10             	add    $0x10,%esp
  if(link("lf2", "lf1") >= 0){
    15cb:	83 ec 08             	sub    $0x8,%esp
    15ce:	68 93 47 00 00       	push   $0x4793
    15d3:	68 97 47 00 00       	push   $0x4797
    15d8:	e8 49 26 00 00       	call   3c26 <link>
    15dd:	83 c4 10             	add    $0x10,%esp
    15e0:	85 c0                	test   %eax,%eax
    15e2:	78 17                	js     15fb <linktest+0x1fd>
    printf(1, "link non-existant succeeded! oops\n");
    15e4:	83 ec 08             	sub    $0x8,%esp
    15e7:	68 40 48 00 00       	push   $0x4840
    15ec:	6a 01                	push   $0x1
    15ee:	e8 55 27 00 00       	call   3d48 <printf>
    15f3:	83 c4 10             	add    $0x10,%esp
    exit();
    15f6:	e8 cb 25 00 00       	call   3bc6 <exit>
  }

  if(link(".", "lf1") >= 0){
    15fb:	83 ec 08             	sub    $0x8,%esp
    15fe:	68 93 47 00 00       	push   $0x4793
    1603:	68 63 48 00 00       	push   $0x4863
    1608:	e8 19 26 00 00       	call   3c26 <link>
    160d:	83 c4 10             	add    $0x10,%esp
    1610:	85 c0                	test   %eax,%eax
    1612:	78 17                	js     162b <linktest+0x22d>
    printf(1, "link . lf1 succeeded! oops\n");
    1614:	83 ec 08             	sub    $0x8,%esp
    1617:	68 65 48 00 00       	push   $0x4865
    161c:	6a 01                	push   $0x1
    161e:	e8 25 27 00 00       	call   3d48 <printf>
    1623:	83 c4 10             	add    $0x10,%esp
    exit();
    1626:	e8 9b 25 00 00       	call   3bc6 <exit>
  }

  printf(1, "linktest ok\n");
    162b:	83 ec 08             	sub    $0x8,%esp
    162e:	68 81 48 00 00       	push   $0x4881
    1633:	6a 01                	push   $0x1
    1635:	e8 0e 27 00 00       	call   3d48 <printf>
    163a:	83 c4 10             	add    $0x10,%esp
}
    163d:	c9                   	leave  
    163e:	c3                   	ret    

0000163f <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    163f:	55                   	push   %ebp
    1640:	89 e5                	mov    %esp,%ebp
    1642:	83 ec 58             	sub    $0x58,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1645:	83 ec 08             	sub    $0x8,%esp
    1648:	68 8e 48 00 00       	push   $0x488e
    164d:	6a 01                	push   $0x1
    164f:	e8 f4 26 00 00       	call   3d48 <printf>
    1654:	83 c4 10             	add    $0x10,%esp
  file[0] = 'C';
    1657:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    165b:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    165f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1666:	e9 d5 00 00 00       	jmp    1740 <concreate+0x101>
    file[1] = '0' + i;
    166b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    166e:	83 c0 30             	add    $0x30,%eax
    1671:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    1674:	83 ec 0c             	sub    $0xc,%esp
    1677:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    167a:	50                   	push   %eax
    167b:	e8 96 25 00 00       	call   3c16 <unlink>
    1680:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    1683:	e8 36 25 00 00       	call   3bbe <fork>
    1688:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    168b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    168f:	74 28                	je     16b9 <concreate+0x7a>
    1691:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1694:	b9 03 00 00 00       	mov    $0x3,%ecx
    1699:	99                   	cltd   
    169a:	f7 f9                	idiv   %ecx
    169c:	89 d0                	mov    %edx,%eax
    169e:	83 f8 01             	cmp    $0x1,%eax
    16a1:	75 16                	jne    16b9 <concreate+0x7a>
      link("C0", file);
    16a3:	83 ec 08             	sub    $0x8,%esp
    16a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16a9:	50                   	push   %eax
    16aa:	68 9e 48 00 00       	push   $0x489e
    16af:	e8 72 25 00 00       	call   3c26 <link>
    16b4:	83 c4 10             	add    $0x10,%esp
    16b7:	eb 74                	jmp    172d <concreate+0xee>
    } else if(pid == 0 && (i % 5) == 1){
    16b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    16bd:	75 28                	jne    16e7 <concreate+0xa8>
    16bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c2:	b9 05 00 00 00       	mov    $0x5,%ecx
    16c7:	99                   	cltd   
    16c8:	f7 f9                	idiv   %ecx
    16ca:	89 d0                	mov    %edx,%eax
    16cc:	83 f8 01             	cmp    $0x1,%eax
    16cf:	75 16                	jne    16e7 <concreate+0xa8>
      link("C0", file);
    16d1:	83 ec 08             	sub    $0x8,%esp
    16d4:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16d7:	50                   	push   %eax
    16d8:	68 9e 48 00 00       	push   $0x489e
    16dd:	e8 44 25 00 00       	call   3c26 <link>
    16e2:	83 c4 10             	add    $0x10,%esp
    16e5:	eb 46                	jmp    172d <concreate+0xee>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    16e7:	83 ec 08             	sub    $0x8,%esp
    16ea:	68 02 02 00 00       	push   $0x202
    16ef:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16f2:	50                   	push   %eax
    16f3:	e8 0e 25 00 00       	call   3c06 <open>
    16f8:	83 c4 10             	add    $0x10,%esp
    16fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    16fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1702:	79 1b                	jns    171f <concreate+0xe0>
        printf(1, "concreate create %s failed\n", file);
    1704:	83 ec 04             	sub    $0x4,%esp
    1707:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    170a:	50                   	push   %eax
    170b:	68 a1 48 00 00       	push   $0x48a1
    1710:	6a 01                	push   $0x1
    1712:	e8 31 26 00 00       	call   3d48 <printf>
    1717:	83 c4 10             	add    $0x10,%esp
        exit();
    171a:	e8 a7 24 00 00       	call   3bc6 <exit>
      }
      close(fd);
    171f:	83 ec 0c             	sub    $0xc,%esp
    1722:	ff 75 e8             	pushl  -0x18(%ebp)
    1725:	e8 c4 24 00 00       	call   3bee <close>
    172a:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    172d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1731:	75 05                	jne    1738 <concreate+0xf9>
      exit();
    1733:	e8 8e 24 00 00       	call   3bc6 <exit>
    else
      wait();
    1738:	e8 91 24 00 00       	call   3bce <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    173d:	ff 45 f4             	incl   -0xc(%ebp)
    1740:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1744:	0f 8e 21 ff ff ff    	jle    166b <concreate+0x2c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    174a:	83 ec 04             	sub    $0x4,%esp
    174d:	6a 28                	push   $0x28
    174f:	6a 00                	push   $0x0
    1751:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1754:	50                   	push   %eax
    1755:	e8 de 22 00 00       	call   3a38 <memset>
    175a:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    175d:	83 ec 08             	sub    $0x8,%esp
    1760:	6a 00                	push   $0x0
    1762:	68 63 48 00 00       	push   $0x4863
    1767:	e8 9a 24 00 00       	call   3c06 <open>
    176c:	83 c4 10             	add    $0x10,%esp
    176f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    1772:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1779:	e9 8d 00 00 00       	jmp    180b <concreate+0x1cc>
    if(de.inum == 0)
    177e:	8b 45 ac             	mov    -0x54(%ebp),%eax
    1781:	66 85 c0             	test   %ax,%ax
    1784:	75 05                	jne    178b <concreate+0x14c>
      continue;
    1786:	e9 80 00 00 00       	jmp    180b <concreate+0x1cc>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    178b:	8a 45 ae             	mov    -0x52(%ebp),%al
    178e:	3c 43                	cmp    $0x43,%al
    1790:	75 79                	jne    180b <concreate+0x1cc>
    1792:	8a 45 b0             	mov    -0x50(%ebp),%al
    1795:	84 c0                	test   %al,%al
    1797:	75 72                	jne    180b <concreate+0x1cc>
      i = de.name[1] - '0';
    1799:	8a 45 af             	mov    -0x51(%ebp),%al
    179c:	0f be c0             	movsbl %al,%eax
    179f:	83 e8 30             	sub    $0x30,%eax
    17a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    17a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17a9:	78 08                	js     17b3 <concreate+0x174>
    17ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ae:	83 f8 27             	cmp    $0x27,%eax
    17b1:	76 1e                	jbe    17d1 <concreate+0x192>
        printf(1, "concreate weird file %s\n", de.name);
    17b3:	83 ec 04             	sub    $0x4,%esp
    17b6:	8d 45 ac             	lea    -0x54(%ebp),%eax
    17b9:	83 c0 02             	add    $0x2,%eax
    17bc:	50                   	push   %eax
    17bd:	68 bd 48 00 00       	push   $0x48bd
    17c2:	6a 01                	push   $0x1
    17c4:	e8 7f 25 00 00       	call   3d48 <printf>
    17c9:	83 c4 10             	add    $0x10,%esp
        exit();
    17cc:	e8 f5 23 00 00       	call   3bc6 <exit>
      }
      if(fa[i]){
    17d1:	8d 55 bd             	lea    -0x43(%ebp),%edx
    17d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d7:	01 d0                	add    %edx,%eax
    17d9:	8a 00                	mov    (%eax),%al
    17db:	84 c0                	test   %al,%al
    17dd:	74 1e                	je     17fd <concreate+0x1be>
        printf(1, "concreate duplicate file %s\n", de.name);
    17df:	83 ec 04             	sub    $0x4,%esp
    17e2:	8d 45 ac             	lea    -0x54(%ebp),%eax
    17e5:	83 c0 02             	add    $0x2,%eax
    17e8:	50                   	push   %eax
    17e9:	68 d6 48 00 00       	push   $0x48d6
    17ee:	6a 01                	push   $0x1
    17f0:	e8 53 25 00 00       	call   3d48 <printf>
    17f5:	83 c4 10             	add    $0x10,%esp
        exit();
    17f8:	e8 c9 23 00 00       	call   3bc6 <exit>
      }
      fa[i] = 1;
    17fd:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1800:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1803:	01 d0                	add    %edx,%eax
    1805:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1808:	ff 45 f0             	incl   -0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    180b:	83 ec 04             	sub    $0x4,%esp
    180e:	6a 10                	push   $0x10
    1810:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1813:	50                   	push   %eax
    1814:	ff 75 e8             	pushl  -0x18(%ebp)
    1817:	e8 c2 23 00 00       	call   3bde <read>
    181c:	83 c4 10             	add    $0x10,%esp
    181f:	85 c0                	test   %eax,%eax
    1821:	0f 8f 57 ff ff ff    	jg     177e <concreate+0x13f>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1827:	83 ec 0c             	sub    $0xc,%esp
    182a:	ff 75 e8             	pushl  -0x18(%ebp)
    182d:	e8 bc 23 00 00       	call   3bee <close>
    1832:	83 c4 10             	add    $0x10,%esp

  if(n != 40){
    1835:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1839:	74 17                	je     1852 <concreate+0x213>
    printf(1, "concreate not enough files in directory listing\n");
    183b:	83 ec 08             	sub    $0x8,%esp
    183e:	68 f4 48 00 00       	push   $0x48f4
    1843:	6a 01                	push   $0x1
    1845:	e8 fe 24 00 00       	call   3d48 <printf>
    184a:	83 c4 10             	add    $0x10,%esp
    exit();
    184d:	e8 74 23 00 00       	call   3bc6 <exit>
  }

  for(i = 0; i < 40; i++){
    1852:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1859:	e9 22 01 00 00       	jmp    1980 <concreate+0x341>
    file[1] = '0' + i;
    185e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1861:	83 c0 30             	add    $0x30,%eax
    1864:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1867:	e8 52 23 00 00       	call   3bbe <fork>
    186c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    186f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1873:	79 17                	jns    188c <concreate+0x24d>
      printf(1, "fork failed\n");
    1875:	83 ec 08             	sub    $0x8,%esp
    1878:	68 e1 44 00 00       	push   $0x44e1
    187d:	6a 01                	push   $0x1
    187f:	e8 c4 24 00 00       	call   3d48 <printf>
    1884:	83 c4 10             	add    $0x10,%esp
      exit();
    1887:	e8 3a 23 00 00       	call   3bc6 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    188c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188f:	b9 03 00 00 00       	mov    $0x3,%ecx
    1894:	99                   	cltd   
    1895:	f7 f9                	idiv   %ecx
    1897:	89 d0                	mov    %edx,%eax
    1899:	85 c0                	test   %eax,%eax
    189b:	75 06                	jne    18a3 <concreate+0x264>
    189d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18a1:	74 18                	je     18bb <concreate+0x27c>
       ((i % 3) == 1 && pid != 0)){
    18a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a6:	b9 03 00 00 00       	mov    $0x3,%ecx
    18ab:	99                   	cltd   
    18ac:	f7 f9                	idiv   %ecx
    18ae:	89 d0                	mov    %edx,%eax
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    18b0:	83 f8 01             	cmp    $0x1,%eax
    18b3:	75 7c                	jne    1931 <concreate+0x2f2>
       ((i % 3) == 1 && pid != 0)){
    18b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18b9:	74 76                	je     1931 <concreate+0x2f2>
      close(open(file, 0));
    18bb:	83 ec 08             	sub    $0x8,%esp
    18be:	6a 00                	push   $0x0
    18c0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    18c3:	50                   	push   %eax
    18c4:	e8 3d 23 00 00       	call   3c06 <open>
    18c9:	83 c4 10             	add    $0x10,%esp
    18cc:	83 ec 0c             	sub    $0xc,%esp
    18cf:	50                   	push   %eax
    18d0:	e8 19 23 00 00       	call   3bee <close>
    18d5:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    18d8:	83 ec 08             	sub    $0x8,%esp
    18db:	6a 00                	push   $0x0
    18dd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    18e0:	50                   	push   %eax
    18e1:	e8 20 23 00 00       	call   3c06 <open>
    18e6:	83 c4 10             	add    $0x10,%esp
    18e9:	83 ec 0c             	sub    $0xc,%esp
    18ec:	50                   	push   %eax
    18ed:	e8 fc 22 00 00       	call   3bee <close>
    18f2:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    18f5:	83 ec 08             	sub    $0x8,%esp
    18f8:	6a 00                	push   $0x0
    18fa:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    18fd:	50                   	push   %eax
    18fe:	e8 03 23 00 00       	call   3c06 <open>
    1903:	83 c4 10             	add    $0x10,%esp
    1906:	83 ec 0c             	sub    $0xc,%esp
    1909:	50                   	push   %eax
    190a:	e8 df 22 00 00       	call   3bee <close>
    190f:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1912:	83 ec 08             	sub    $0x8,%esp
    1915:	6a 00                	push   $0x0
    1917:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    191a:	50                   	push   %eax
    191b:	e8 e6 22 00 00       	call   3c06 <open>
    1920:	83 c4 10             	add    $0x10,%esp
    1923:	83 ec 0c             	sub    $0xc,%esp
    1926:	50                   	push   %eax
    1927:	e8 c2 22 00 00       	call   3bee <close>
    192c:	83 c4 10             	add    $0x10,%esp
    192f:	eb 3c                	jmp    196d <concreate+0x32e>
    } else {
      unlink(file);
    1931:	83 ec 0c             	sub    $0xc,%esp
    1934:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1937:	50                   	push   %eax
    1938:	e8 d9 22 00 00       	call   3c16 <unlink>
    193d:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1940:	83 ec 0c             	sub    $0xc,%esp
    1943:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1946:	50                   	push   %eax
    1947:	e8 ca 22 00 00       	call   3c16 <unlink>
    194c:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    194f:	83 ec 0c             	sub    $0xc,%esp
    1952:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1955:	50                   	push   %eax
    1956:	e8 bb 22 00 00       	call   3c16 <unlink>
    195b:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    195e:	83 ec 0c             	sub    $0xc,%esp
    1961:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1964:	50                   	push   %eax
    1965:	e8 ac 22 00 00       	call   3c16 <unlink>
    196a:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    196d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1971:	75 05                	jne    1978 <concreate+0x339>
      exit();
    1973:	e8 4e 22 00 00       	call   3bc6 <exit>
    else
      wait();
    1978:	e8 51 22 00 00       	call   3bce <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    197d:	ff 45 f4             	incl   -0xc(%ebp)
    1980:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1984:	0f 8e d4 fe ff ff    	jle    185e <concreate+0x21f>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    198a:	83 ec 08             	sub    $0x8,%esp
    198d:	68 25 49 00 00       	push   $0x4925
    1992:	6a 01                	push   $0x1
    1994:	e8 af 23 00 00       	call   3d48 <printf>
    1999:	83 c4 10             	add    $0x10,%esp
}
    199c:	c9                   	leave  
    199d:	c3                   	ret    

0000199e <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    199e:	55                   	push   %ebp
    199f:	89 e5                	mov    %esp,%ebp
    19a1:	83 ec 18             	sub    $0x18,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    19a4:	83 ec 08             	sub    $0x8,%esp
    19a7:	68 33 49 00 00       	push   $0x4933
    19ac:	6a 01                	push   $0x1
    19ae:	e8 95 23 00 00       	call   3d48 <printf>
    19b3:	83 c4 10             	add    $0x10,%esp

  unlink("x");
    19b6:	83 ec 0c             	sub    $0xc,%esp
    19b9:	68 9a 44 00 00       	push   $0x449a
    19be:	e8 53 22 00 00       	call   3c16 <unlink>
    19c3:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    19c6:	e8 f3 21 00 00       	call   3bbe <fork>
    19cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    19ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19d2:	79 17                	jns    19eb <linkunlink+0x4d>
    printf(1, "fork failed\n");
    19d4:	83 ec 08             	sub    $0x8,%esp
    19d7:	68 e1 44 00 00       	push   $0x44e1
    19dc:	6a 01                	push   $0x1
    19de:	e8 65 23 00 00       	call   3d48 <printf>
    19e3:	83 c4 10             	add    $0x10,%esp
    exit();
    19e6:	e8 db 21 00 00       	call   3bc6 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    19eb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19ef:	74 07                	je     19f8 <linkunlink+0x5a>
    19f1:	b8 01 00 00 00       	mov    $0x1,%eax
    19f6:	eb 05                	jmp    19fd <linkunlink+0x5f>
    19f8:	b8 61 00 00 00       	mov    $0x61,%eax
    19fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1a00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a07:	e9 af 00 00 00       	jmp    1abb <linkunlink+0x11d>
    x = x * 1103515245 + 12345;
    1a0c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1a0f:	89 ca                	mov    %ecx,%edx
    1a11:	89 d0                	mov    %edx,%eax
    1a13:	c1 e0 09             	shl    $0x9,%eax
    1a16:	89 c2                	mov    %eax,%edx
    1a18:	29 ca                	sub    %ecx,%edx
    1a1a:	c1 e2 02             	shl    $0x2,%edx
    1a1d:	01 ca                	add    %ecx,%edx
    1a1f:	89 d0                	mov    %edx,%eax
    1a21:	c1 e0 09             	shl    $0x9,%eax
    1a24:	29 d0                	sub    %edx,%eax
    1a26:	01 c0                	add    %eax,%eax
    1a28:	01 c8                	add    %ecx,%eax
    1a2a:	89 c2                	mov    %eax,%edx
    1a2c:	c1 e2 05             	shl    $0x5,%edx
    1a2f:	01 d0                	add    %edx,%eax
    1a31:	c1 e0 02             	shl    $0x2,%eax
    1a34:	29 c8                	sub    %ecx,%eax
    1a36:	c1 e0 02             	shl    $0x2,%eax
    1a39:	01 c8                	add    %ecx,%eax
    1a3b:	05 39 30 00 00       	add    $0x3039,%eax
    1a40:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1a43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a46:	b9 03 00 00 00       	mov    $0x3,%ecx
    1a4b:	ba 00 00 00 00       	mov    $0x0,%edx
    1a50:	f7 f1                	div    %ecx
    1a52:	89 d0                	mov    %edx,%eax
    1a54:	85 c0                	test   %eax,%eax
    1a56:	75 23                	jne    1a7b <linkunlink+0xdd>
      close(open("x", O_RDWR | O_CREATE));
    1a58:	83 ec 08             	sub    $0x8,%esp
    1a5b:	68 02 02 00 00       	push   $0x202
    1a60:	68 9a 44 00 00       	push   $0x449a
    1a65:	e8 9c 21 00 00       	call   3c06 <open>
    1a6a:	83 c4 10             	add    $0x10,%esp
    1a6d:	83 ec 0c             	sub    $0xc,%esp
    1a70:	50                   	push   %eax
    1a71:	e8 78 21 00 00       	call   3bee <close>
    1a76:	83 c4 10             	add    $0x10,%esp
    1a79:	eb 3d                	jmp    1ab8 <linkunlink+0x11a>
    } else if((x % 3) == 1){
    1a7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a7e:	b9 03 00 00 00       	mov    $0x3,%ecx
    1a83:	ba 00 00 00 00       	mov    $0x0,%edx
    1a88:	f7 f1                	div    %ecx
    1a8a:	89 d0                	mov    %edx,%eax
    1a8c:	83 f8 01             	cmp    $0x1,%eax
    1a8f:	75 17                	jne    1aa8 <linkunlink+0x10a>
      link("cat", "x");
    1a91:	83 ec 08             	sub    $0x8,%esp
    1a94:	68 9a 44 00 00       	push   $0x449a
    1a99:	68 44 49 00 00       	push   $0x4944
    1a9e:	e8 83 21 00 00       	call   3c26 <link>
    1aa3:	83 c4 10             	add    $0x10,%esp
    1aa6:	eb 10                	jmp    1ab8 <linkunlink+0x11a>
    } else {
      unlink("x");
    1aa8:	83 ec 0c             	sub    $0xc,%esp
    1aab:	68 9a 44 00 00       	push   $0x449a
    1ab0:	e8 61 21 00 00       	call   3c16 <unlink>
    1ab5:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1ab8:	ff 45 f4             	incl   -0xc(%ebp)
    1abb:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1abf:	0f 8e 47 ff ff ff    	jle    1a0c <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1ac5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ac9:	74 07                	je     1ad2 <linkunlink+0x134>
    wait();
    1acb:	e8 fe 20 00 00       	call   3bce <wait>
    1ad0:	eb 05                	jmp    1ad7 <linkunlink+0x139>
  else 
    exit();
    1ad2:	e8 ef 20 00 00       	call   3bc6 <exit>

  printf(1, "linkunlink ok\n");
    1ad7:	83 ec 08             	sub    $0x8,%esp
    1ada:	68 48 49 00 00       	push   $0x4948
    1adf:	6a 01                	push   $0x1
    1ae1:	e8 62 22 00 00       	call   3d48 <printf>
    1ae6:	83 c4 10             	add    $0x10,%esp
}
    1ae9:	c9                   	leave  
    1aea:	c3                   	ret    

00001aeb <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1aeb:	55                   	push   %ebp
    1aec:	89 e5                	mov    %esp,%ebp
    1aee:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1af1:	83 ec 08             	sub    $0x8,%esp
    1af4:	68 57 49 00 00       	push   $0x4957
    1af9:	6a 01                	push   $0x1
    1afb:	e8 48 22 00 00       	call   3d48 <printf>
    1b00:	83 c4 10             	add    $0x10,%esp
  unlink("bd");
    1b03:	83 ec 0c             	sub    $0xc,%esp
    1b06:	68 64 49 00 00       	push   $0x4964
    1b0b:	e8 06 21 00 00       	call   3c16 <unlink>
    1b10:	83 c4 10             	add    $0x10,%esp

  fd = open("bd", O_CREATE);
    1b13:	83 ec 08             	sub    $0x8,%esp
    1b16:	68 00 02 00 00       	push   $0x200
    1b1b:	68 64 49 00 00       	push   $0x4964
    1b20:	e8 e1 20 00 00       	call   3c06 <open>
    1b25:	83 c4 10             	add    $0x10,%esp
    1b28:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1b2b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b2f:	79 17                	jns    1b48 <bigdir+0x5d>
    printf(1, "bigdir create failed\n");
    1b31:	83 ec 08             	sub    $0x8,%esp
    1b34:	68 67 49 00 00       	push   $0x4967
    1b39:	6a 01                	push   $0x1
    1b3b:	e8 08 22 00 00       	call   3d48 <printf>
    1b40:	83 c4 10             	add    $0x10,%esp
    exit();
    1b43:	e8 7e 20 00 00       	call   3bc6 <exit>
  }
  close(fd);
    1b48:	83 ec 0c             	sub    $0xc,%esp
    1b4b:	ff 75 f0             	pushl  -0x10(%ebp)
    1b4e:	e8 9b 20 00 00       	call   3bee <close>
    1b53:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 500; i++){
    1b56:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1b5d:	eb 64                	jmp    1bc3 <bigdir+0xd8>
    name[0] = 'x';
    1b5f:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b66:	85 c0                	test   %eax,%eax
    1b68:	79 03                	jns    1b6d <bigdir+0x82>
    1b6a:	83 c0 3f             	add    $0x3f,%eax
    1b6d:	c1 f8 06             	sar    $0x6,%eax
    1b70:	83 c0 30             	add    $0x30,%eax
    1b73:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b79:	25 3f 00 00 80       	and    $0x8000003f,%eax
    1b7e:	85 c0                	test   %eax,%eax
    1b80:	79 05                	jns    1b87 <bigdir+0x9c>
    1b82:	48                   	dec    %eax
    1b83:	83 c8 c0             	or     $0xffffffc0,%eax
    1b86:	40                   	inc    %eax
    1b87:	83 c0 30             	add    $0x30,%eax
    1b8a:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1b8d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1b91:	83 ec 08             	sub    $0x8,%esp
    1b94:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1b97:	50                   	push   %eax
    1b98:	68 64 49 00 00       	push   $0x4964
    1b9d:	e8 84 20 00 00       	call   3c26 <link>
    1ba2:	83 c4 10             	add    $0x10,%esp
    1ba5:	85 c0                	test   %eax,%eax
    1ba7:	74 17                	je     1bc0 <bigdir+0xd5>
      printf(1, "bigdir link failed\n");
    1ba9:	83 ec 08             	sub    $0x8,%esp
    1bac:	68 7d 49 00 00       	push   $0x497d
    1bb1:	6a 01                	push   $0x1
    1bb3:	e8 90 21 00 00       	call   3d48 <printf>
    1bb8:	83 c4 10             	add    $0x10,%esp
      exit();
    1bbb:	e8 06 20 00 00       	call   3bc6 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1bc0:	ff 45 f4             	incl   -0xc(%ebp)
    1bc3:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1bca:	7e 93                	jle    1b5f <bigdir+0x74>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1bcc:	83 ec 0c             	sub    $0xc,%esp
    1bcf:	68 64 49 00 00       	push   $0x4964
    1bd4:	e8 3d 20 00 00       	call   3c16 <unlink>
    1bd9:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1bdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1be3:	eb 5f                	jmp    1c44 <bigdir+0x159>
    name[0] = 'x';
    1be5:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bec:	85 c0                	test   %eax,%eax
    1bee:	79 03                	jns    1bf3 <bigdir+0x108>
    1bf0:	83 c0 3f             	add    $0x3f,%eax
    1bf3:	c1 f8 06             	sar    $0x6,%eax
    1bf6:	83 c0 30             	add    $0x30,%eax
    1bf9:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bff:	25 3f 00 00 80       	and    $0x8000003f,%eax
    1c04:	85 c0                	test   %eax,%eax
    1c06:	79 05                	jns    1c0d <bigdir+0x122>
    1c08:	48                   	dec    %eax
    1c09:	83 c8 c0             	or     $0xffffffc0,%eax
    1c0c:	40                   	inc    %eax
    1c0d:	83 c0 30             	add    $0x30,%eax
    1c10:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c13:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1c17:	83 ec 0c             	sub    $0xc,%esp
    1c1a:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c1d:	50                   	push   %eax
    1c1e:	e8 f3 1f 00 00       	call   3c16 <unlink>
    1c23:	83 c4 10             	add    $0x10,%esp
    1c26:	85 c0                	test   %eax,%eax
    1c28:	74 17                	je     1c41 <bigdir+0x156>
      printf(1, "bigdir unlink failed");
    1c2a:	83 ec 08             	sub    $0x8,%esp
    1c2d:	68 91 49 00 00       	push   $0x4991
    1c32:	6a 01                	push   $0x1
    1c34:	e8 0f 21 00 00       	call   3d48 <printf>
    1c39:	83 c4 10             	add    $0x10,%esp
      exit();
    1c3c:	e8 85 1f 00 00       	call   3bc6 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1c41:	ff 45 f4             	incl   -0xc(%ebp)
    1c44:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1c4b:	7e 98                	jle    1be5 <bigdir+0xfa>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1c4d:	83 ec 08             	sub    $0x8,%esp
    1c50:	68 a6 49 00 00       	push   $0x49a6
    1c55:	6a 01                	push   $0x1
    1c57:	e8 ec 20 00 00       	call   3d48 <printf>
    1c5c:	83 c4 10             	add    $0x10,%esp
}
    1c5f:	c9                   	leave  
    1c60:	c3                   	ret    

00001c61 <subdir>:

void
subdir(void)
{
    1c61:	55                   	push   %ebp
    1c62:	89 e5                	mov    %esp,%ebp
    1c64:	83 ec 18             	sub    $0x18,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1c67:	83 ec 08             	sub    $0x8,%esp
    1c6a:	68 b1 49 00 00       	push   $0x49b1
    1c6f:	6a 01                	push   $0x1
    1c71:	e8 d2 20 00 00       	call   3d48 <printf>
    1c76:	83 c4 10             	add    $0x10,%esp

  unlink("ff");
    1c79:	83 ec 0c             	sub    $0xc,%esp
    1c7c:	68 be 49 00 00       	push   $0x49be
    1c81:	e8 90 1f 00 00       	call   3c16 <unlink>
    1c86:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dd") != 0){
    1c89:	83 ec 0c             	sub    $0xc,%esp
    1c8c:	68 c1 49 00 00       	push   $0x49c1
    1c91:	e8 98 1f 00 00       	call   3c2e <mkdir>
    1c96:	83 c4 10             	add    $0x10,%esp
    1c99:	85 c0                	test   %eax,%eax
    1c9b:	74 17                	je     1cb4 <subdir+0x53>
    printf(1, "subdir mkdir dd failed\n");
    1c9d:	83 ec 08             	sub    $0x8,%esp
    1ca0:	68 c4 49 00 00       	push   $0x49c4
    1ca5:	6a 01                	push   $0x1
    1ca7:	e8 9c 20 00 00       	call   3d48 <printf>
    1cac:	83 c4 10             	add    $0x10,%esp
    exit();
    1caf:	e8 12 1f 00 00       	call   3bc6 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1cb4:	83 ec 08             	sub    $0x8,%esp
    1cb7:	68 02 02 00 00       	push   $0x202
    1cbc:	68 dc 49 00 00       	push   $0x49dc
    1cc1:	e8 40 1f 00 00       	call   3c06 <open>
    1cc6:	83 c4 10             	add    $0x10,%esp
    1cc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1ccc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1cd0:	79 17                	jns    1ce9 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    1cd2:	83 ec 08             	sub    $0x8,%esp
    1cd5:	68 e2 49 00 00       	push   $0x49e2
    1cda:	6a 01                	push   $0x1
    1cdc:	e8 67 20 00 00       	call   3d48 <printf>
    1ce1:	83 c4 10             	add    $0x10,%esp
    exit();
    1ce4:	e8 dd 1e 00 00       	call   3bc6 <exit>
  }
  write(fd, "ff", 2);
    1ce9:	83 ec 04             	sub    $0x4,%esp
    1cec:	6a 02                	push   $0x2
    1cee:	68 be 49 00 00       	push   $0x49be
    1cf3:	ff 75 f4             	pushl  -0xc(%ebp)
    1cf6:	e8 eb 1e 00 00       	call   3be6 <write>
    1cfb:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1cfe:	83 ec 0c             	sub    $0xc,%esp
    1d01:	ff 75 f4             	pushl  -0xc(%ebp)
    1d04:	e8 e5 1e 00 00       	call   3bee <close>
    1d09:	83 c4 10             	add    $0x10,%esp
  
  if(unlink("dd") >= 0){
    1d0c:	83 ec 0c             	sub    $0xc,%esp
    1d0f:	68 c1 49 00 00       	push   $0x49c1
    1d14:	e8 fd 1e 00 00       	call   3c16 <unlink>
    1d19:	83 c4 10             	add    $0x10,%esp
    1d1c:	85 c0                	test   %eax,%eax
    1d1e:	78 17                	js     1d37 <subdir+0xd6>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1d20:	83 ec 08             	sub    $0x8,%esp
    1d23:	68 f8 49 00 00       	push   $0x49f8
    1d28:	6a 01                	push   $0x1
    1d2a:	e8 19 20 00 00       	call   3d48 <printf>
    1d2f:	83 c4 10             	add    $0x10,%esp
    exit();
    1d32:	e8 8f 1e 00 00       	call   3bc6 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    1d37:	83 ec 0c             	sub    $0xc,%esp
    1d3a:	68 1e 4a 00 00       	push   $0x4a1e
    1d3f:	e8 ea 1e 00 00       	call   3c2e <mkdir>
    1d44:	83 c4 10             	add    $0x10,%esp
    1d47:	85 c0                	test   %eax,%eax
    1d49:	74 17                	je     1d62 <subdir+0x101>
    printf(1, "subdir mkdir dd/dd failed\n");
    1d4b:	83 ec 08             	sub    $0x8,%esp
    1d4e:	68 25 4a 00 00       	push   $0x4a25
    1d53:	6a 01                	push   $0x1
    1d55:	e8 ee 1f 00 00       	call   3d48 <printf>
    1d5a:	83 c4 10             	add    $0x10,%esp
    exit();
    1d5d:	e8 64 1e 00 00       	call   3bc6 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d62:	83 ec 08             	sub    $0x8,%esp
    1d65:	68 02 02 00 00       	push   $0x202
    1d6a:	68 40 4a 00 00       	push   $0x4a40
    1d6f:	e8 92 1e 00 00       	call   3c06 <open>
    1d74:	83 c4 10             	add    $0x10,%esp
    1d77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1d7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d7e:	79 17                	jns    1d97 <subdir+0x136>
    printf(1, "create dd/dd/ff failed\n");
    1d80:	83 ec 08             	sub    $0x8,%esp
    1d83:	68 49 4a 00 00       	push   $0x4a49
    1d88:	6a 01                	push   $0x1
    1d8a:	e8 b9 1f 00 00       	call   3d48 <printf>
    1d8f:	83 c4 10             	add    $0x10,%esp
    exit();
    1d92:	e8 2f 1e 00 00       	call   3bc6 <exit>
  }
  write(fd, "FF", 2);
    1d97:	83 ec 04             	sub    $0x4,%esp
    1d9a:	6a 02                	push   $0x2
    1d9c:	68 61 4a 00 00       	push   $0x4a61
    1da1:	ff 75 f4             	pushl  -0xc(%ebp)
    1da4:	e8 3d 1e 00 00       	call   3be6 <write>
    1da9:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1dac:	83 ec 0c             	sub    $0xc,%esp
    1daf:	ff 75 f4             	pushl  -0xc(%ebp)
    1db2:	e8 37 1e 00 00       	call   3bee <close>
    1db7:	83 c4 10             	add    $0x10,%esp

  fd = open("dd/dd/../ff", 0);
    1dba:	83 ec 08             	sub    $0x8,%esp
    1dbd:	6a 00                	push   $0x0
    1dbf:	68 64 4a 00 00       	push   $0x4a64
    1dc4:	e8 3d 1e 00 00       	call   3c06 <open>
    1dc9:	83 c4 10             	add    $0x10,%esp
    1dcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1dcf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1dd3:	79 17                	jns    1dec <subdir+0x18b>
    printf(1, "open dd/dd/../ff failed\n");
    1dd5:	83 ec 08             	sub    $0x8,%esp
    1dd8:	68 70 4a 00 00       	push   $0x4a70
    1ddd:	6a 01                	push   $0x1
    1ddf:	e8 64 1f 00 00       	call   3d48 <printf>
    1de4:	83 c4 10             	add    $0x10,%esp
    exit();
    1de7:	e8 da 1d 00 00       	call   3bc6 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    1dec:	83 ec 04             	sub    $0x4,%esp
    1def:	68 00 20 00 00       	push   $0x2000
    1df4:	68 40 86 00 00       	push   $0x8640
    1df9:	ff 75 f4             	pushl  -0xc(%ebp)
    1dfc:	e8 dd 1d 00 00       	call   3bde <read>
    1e01:	83 c4 10             	add    $0x10,%esp
    1e04:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    1e07:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1e0b:	75 09                	jne    1e16 <subdir+0x1b5>
    1e0d:	a0 40 86 00 00       	mov    0x8640,%al
    1e12:	3c 66                	cmp    $0x66,%al
    1e14:	74 17                	je     1e2d <subdir+0x1cc>
    printf(1, "dd/dd/../ff wrong content\n");
    1e16:	83 ec 08             	sub    $0x8,%esp
    1e19:	68 89 4a 00 00       	push   $0x4a89
    1e1e:	6a 01                	push   $0x1
    1e20:	e8 23 1f 00 00       	call   3d48 <printf>
    1e25:	83 c4 10             	add    $0x10,%esp
    exit();
    1e28:	e8 99 1d 00 00       	call   3bc6 <exit>
  }
  close(fd);
    1e2d:	83 ec 0c             	sub    $0xc,%esp
    1e30:	ff 75 f4             	pushl  -0xc(%ebp)
    1e33:	e8 b6 1d 00 00       	call   3bee <close>
    1e38:	83 c4 10             	add    $0x10,%esp

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e3b:	83 ec 08             	sub    $0x8,%esp
    1e3e:	68 a4 4a 00 00       	push   $0x4aa4
    1e43:	68 40 4a 00 00       	push   $0x4a40
    1e48:	e8 d9 1d 00 00       	call   3c26 <link>
    1e4d:	83 c4 10             	add    $0x10,%esp
    1e50:	85 c0                	test   %eax,%eax
    1e52:	74 17                	je     1e6b <subdir+0x20a>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1e54:	83 ec 08             	sub    $0x8,%esp
    1e57:	68 b0 4a 00 00       	push   $0x4ab0
    1e5c:	6a 01                	push   $0x1
    1e5e:	e8 e5 1e 00 00       	call   3d48 <printf>
    1e63:	83 c4 10             	add    $0x10,%esp
    exit();
    1e66:	e8 5b 1d 00 00       	call   3bc6 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    1e6b:	83 ec 0c             	sub    $0xc,%esp
    1e6e:	68 40 4a 00 00       	push   $0x4a40
    1e73:	e8 9e 1d 00 00       	call   3c16 <unlink>
    1e78:	83 c4 10             	add    $0x10,%esp
    1e7b:	85 c0                	test   %eax,%eax
    1e7d:	74 17                	je     1e96 <subdir+0x235>
    printf(1, "unlink dd/dd/ff failed\n");
    1e7f:	83 ec 08             	sub    $0x8,%esp
    1e82:	68 d1 4a 00 00       	push   $0x4ad1
    1e87:	6a 01                	push   $0x1
    1e89:	e8 ba 1e 00 00       	call   3d48 <printf>
    1e8e:	83 c4 10             	add    $0x10,%esp
    exit();
    1e91:	e8 30 1d 00 00       	call   3bc6 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e96:	83 ec 08             	sub    $0x8,%esp
    1e99:	6a 00                	push   $0x0
    1e9b:	68 40 4a 00 00       	push   $0x4a40
    1ea0:	e8 61 1d 00 00       	call   3c06 <open>
    1ea5:	83 c4 10             	add    $0x10,%esp
    1ea8:	85 c0                	test   %eax,%eax
    1eaa:	78 17                	js     1ec3 <subdir+0x262>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1eac:	83 ec 08             	sub    $0x8,%esp
    1eaf:	68 ec 4a 00 00       	push   $0x4aec
    1eb4:	6a 01                	push   $0x1
    1eb6:	e8 8d 1e 00 00       	call   3d48 <printf>
    1ebb:	83 c4 10             	add    $0x10,%esp
    exit();
    1ebe:	e8 03 1d 00 00       	call   3bc6 <exit>
  }

  if(chdir("dd") != 0){
    1ec3:	83 ec 0c             	sub    $0xc,%esp
    1ec6:	68 c1 49 00 00       	push   $0x49c1
    1ecb:	e8 66 1d 00 00       	call   3c36 <chdir>
    1ed0:	83 c4 10             	add    $0x10,%esp
    1ed3:	85 c0                	test   %eax,%eax
    1ed5:	74 17                	je     1eee <subdir+0x28d>
    printf(1, "chdir dd failed\n");
    1ed7:	83 ec 08             	sub    $0x8,%esp
    1eda:	68 10 4b 00 00       	push   $0x4b10
    1edf:	6a 01                	push   $0x1
    1ee1:	e8 62 1e 00 00       	call   3d48 <printf>
    1ee6:	83 c4 10             	add    $0x10,%esp
    exit();
    1ee9:	e8 d8 1c 00 00       	call   3bc6 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    1eee:	83 ec 0c             	sub    $0xc,%esp
    1ef1:	68 21 4b 00 00       	push   $0x4b21
    1ef6:	e8 3b 1d 00 00       	call   3c36 <chdir>
    1efb:	83 c4 10             	add    $0x10,%esp
    1efe:	85 c0                	test   %eax,%eax
    1f00:	74 17                	je     1f19 <subdir+0x2b8>
    printf(1, "chdir dd/../../dd failed\n");
    1f02:	83 ec 08             	sub    $0x8,%esp
    1f05:	68 2d 4b 00 00       	push   $0x4b2d
    1f0a:	6a 01                	push   $0x1
    1f0c:	e8 37 1e 00 00       	call   3d48 <printf>
    1f11:	83 c4 10             	add    $0x10,%esp
    exit();
    1f14:	e8 ad 1c 00 00       	call   3bc6 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    1f19:	83 ec 0c             	sub    $0xc,%esp
    1f1c:	68 47 4b 00 00       	push   $0x4b47
    1f21:	e8 10 1d 00 00       	call   3c36 <chdir>
    1f26:	83 c4 10             	add    $0x10,%esp
    1f29:	85 c0                	test   %eax,%eax
    1f2b:	74 17                	je     1f44 <subdir+0x2e3>
    printf(1, "chdir dd/../../dd failed\n");
    1f2d:	83 ec 08             	sub    $0x8,%esp
    1f30:	68 2d 4b 00 00       	push   $0x4b2d
    1f35:	6a 01                	push   $0x1
    1f37:	e8 0c 1e 00 00       	call   3d48 <printf>
    1f3c:	83 c4 10             	add    $0x10,%esp
    exit();
    1f3f:	e8 82 1c 00 00       	call   3bc6 <exit>
  }
  if(chdir("./..") != 0){
    1f44:	83 ec 0c             	sub    $0xc,%esp
    1f47:	68 56 4b 00 00       	push   $0x4b56
    1f4c:	e8 e5 1c 00 00       	call   3c36 <chdir>
    1f51:	83 c4 10             	add    $0x10,%esp
    1f54:	85 c0                	test   %eax,%eax
    1f56:	74 17                	je     1f6f <subdir+0x30e>
    printf(1, "chdir ./.. failed\n");
    1f58:	83 ec 08             	sub    $0x8,%esp
    1f5b:	68 5b 4b 00 00       	push   $0x4b5b
    1f60:	6a 01                	push   $0x1
    1f62:	e8 e1 1d 00 00       	call   3d48 <printf>
    1f67:	83 c4 10             	add    $0x10,%esp
    exit();
    1f6a:	e8 57 1c 00 00       	call   3bc6 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    1f6f:	83 ec 08             	sub    $0x8,%esp
    1f72:	6a 00                	push   $0x0
    1f74:	68 a4 4a 00 00       	push   $0x4aa4
    1f79:	e8 88 1c 00 00       	call   3c06 <open>
    1f7e:	83 c4 10             	add    $0x10,%esp
    1f81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1f84:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1f88:	79 17                	jns    1fa1 <subdir+0x340>
    printf(1, "open dd/dd/ffff failed\n");
    1f8a:	83 ec 08             	sub    $0x8,%esp
    1f8d:	68 6e 4b 00 00       	push   $0x4b6e
    1f92:	6a 01                	push   $0x1
    1f94:	e8 af 1d 00 00       	call   3d48 <printf>
    1f99:	83 c4 10             	add    $0x10,%esp
    exit();
    1f9c:	e8 25 1c 00 00       	call   3bc6 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1fa1:	83 ec 04             	sub    $0x4,%esp
    1fa4:	68 00 20 00 00       	push   $0x2000
    1fa9:	68 40 86 00 00       	push   $0x8640
    1fae:	ff 75 f4             	pushl  -0xc(%ebp)
    1fb1:	e8 28 1c 00 00       	call   3bde <read>
    1fb6:	83 c4 10             	add    $0x10,%esp
    1fb9:	83 f8 02             	cmp    $0x2,%eax
    1fbc:	74 17                	je     1fd5 <subdir+0x374>
    printf(1, "read dd/dd/ffff wrong len\n");
    1fbe:	83 ec 08             	sub    $0x8,%esp
    1fc1:	68 86 4b 00 00       	push   $0x4b86
    1fc6:	6a 01                	push   $0x1
    1fc8:	e8 7b 1d 00 00       	call   3d48 <printf>
    1fcd:	83 c4 10             	add    $0x10,%esp
    exit();
    1fd0:	e8 f1 1b 00 00       	call   3bc6 <exit>
  }
  close(fd);
    1fd5:	83 ec 0c             	sub    $0xc,%esp
    1fd8:	ff 75 f4             	pushl  -0xc(%ebp)
    1fdb:	e8 0e 1c 00 00       	call   3bee <close>
    1fe0:	83 c4 10             	add    $0x10,%esp

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1fe3:	83 ec 08             	sub    $0x8,%esp
    1fe6:	6a 00                	push   $0x0
    1fe8:	68 40 4a 00 00       	push   $0x4a40
    1fed:	e8 14 1c 00 00       	call   3c06 <open>
    1ff2:	83 c4 10             	add    $0x10,%esp
    1ff5:	85 c0                	test   %eax,%eax
    1ff7:	78 17                	js     2010 <subdir+0x3af>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1ff9:	83 ec 08             	sub    $0x8,%esp
    1ffc:	68 a4 4b 00 00       	push   $0x4ba4
    2001:	6a 01                	push   $0x1
    2003:	e8 40 1d 00 00       	call   3d48 <printf>
    2008:	83 c4 10             	add    $0x10,%esp
    exit();
    200b:	e8 b6 1b 00 00       	call   3bc6 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2010:	83 ec 08             	sub    $0x8,%esp
    2013:	68 02 02 00 00       	push   $0x202
    2018:	68 c9 4b 00 00       	push   $0x4bc9
    201d:	e8 e4 1b 00 00       	call   3c06 <open>
    2022:	83 c4 10             	add    $0x10,%esp
    2025:	85 c0                	test   %eax,%eax
    2027:	78 17                	js     2040 <subdir+0x3df>
    printf(1, "create dd/ff/ff succeeded!\n");
    2029:	83 ec 08             	sub    $0x8,%esp
    202c:	68 d2 4b 00 00       	push   $0x4bd2
    2031:	6a 01                	push   $0x1
    2033:	e8 10 1d 00 00       	call   3d48 <printf>
    2038:	83 c4 10             	add    $0x10,%esp
    exit();
    203b:	e8 86 1b 00 00       	call   3bc6 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2040:	83 ec 08             	sub    $0x8,%esp
    2043:	68 02 02 00 00       	push   $0x202
    2048:	68 ee 4b 00 00       	push   $0x4bee
    204d:	e8 b4 1b 00 00       	call   3c06 <open>
    2052:	83 c4 10             	add    $0x10,%esp
    2055:	85 c0                	test   %eax,%eax
    2057:	78 17                	js     2070 <subdir+0x40f>
    printf(1, "create dd/xx/ff succeeded!\n");
    2059:	83 ec 08             	sub    $0x8,%esp
    205c:	68 f7 4b 00 00       	push   $0x4bf7
    2061:	6a 01                	push   $0x1
    2063:	e8 e0 1c 00 00       	call   3d48 <printf>
    2068:	83 c4 10             	add    $0x10,%esp
    exit();
    206b:	e8 56 1b 00 00       	call   3bc6 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    2070:	83 ec 08             	sub    $0x8,%esp
    2073:	68 00 02 00 00       	push   $0x200
    2078:	68 c1 49 00 00       	push   $0x49c1
    207d:	e8 84 1b 00 00       	call   3c06 <open>
    2082:	83 c4 10             	add    $0x10,%esp
    2085:	85 c0                	test   %eax,%eax
    2087:	78 17                	js     20a0 <subdir+0x43f>
    printf(1, "create dd succeeded!\n");
    2089:	83 ec 08             	sub    $0x8,%esp
    208c:	68 13 4c 00 00       	push   $0x4c13
    2091:	6a 01                	push   $0x1
    2093:	e8 b0 1c 00 00       	call   3d48 <printf>
    2098:	83 c4 10             	add    $0x10,%esp
    exit();
    209b:	e8 26 1b 00 00       	call   3bc6 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    20a0:	83 ec 08             	sub    $0x8,%esp
    20a3:	6a 02                	push   $0x2
    20a5:	68 c1 49 00 00       	push   $0x49c1
    20aa:	e8 57 1b 00 00       	call   3c06 <open>
    20af:	83 c4 10             	add    $0x10,%esp
    20b2:	85 c0                	test   %eax,%eax
    20b4:	78 17                	js     20cd <subdir+0x46c>
    printf(1, "open dd rdwr succeeded!\n");
    20b6:	83 ec 08             	sub    $0x8,%esp
    20b9:	68 29 4c 00 00       	push   $0x4c29
    20be:	6a 01                	push   $0x1
    20c0:	e8 83 1c 00 00       	call   3d48 <printf>
    20c5:	83 c4 10             	add    $0x10,%esp
    exit();
    20c8:	e8 f9 1a 00 00       	call   3bc6 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    20cd:	83 ec 08             	sub    $0x8,%esp
    20d0:	6a 01                	push   $0x1
    20d2:	68 c1 49 00 00       	push   $0x49c1
    20d7:	e8 2a 1b 00 00       	call   3c06 <open>
    20dc:	83 c4 10             	add    $0x10,%esp
    20df:	85 c0                	test   %eax,%eax
    20e1:	78 17                	js     20fa <subdir+0x499>
    printf(1, "open dd wronly succeeded!\n");
    20e3:	83 ec 08             	sub    $0x8,%esp
    20e6:	68 42 4c 00 00       	push   $0x4c42
    20eb:	6a 01                	push   $0x1
    20ed:	e8 56 1c 00 00       	call   3d48 <printf>
    20f2:	83 c4 10             	add    $0x10,%esp
    exit();
    20f5:	e8 cc 1a 00 00       	call   3bc6 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    20fa:	83 ec 08             	sub    $0x8,%esp
    20fd:	68 5d 4c 00 00       	push   $0x4c5d
    2102:	68 c9 4b 00 00       	push   $0x4bc9
    2107:	e8 1a 1b 00 00       	call   3c26 <link>
    210c:	83 c4 10             	add    $0x10,%esp
    210f:	85 c0                	test   %eax,%eax
    2111:	75 17                	jne    212a <subdir+0x4c9>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2113:	83 ec 08             	sub    $0x8,%esp
    2116:	68 68 4c 00 00       	push   $0x4c68
    211b:	6a 01                	push   $0x1
    211d:	e8 26 1c 00 00       	call   3d48 <printf>
    2122:	83 c4 10             	add    $0x10,%esp
    exit();
    2125:	e8 9c 1a 00 00       	call   3bc6 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    212a:	83 ec 08             	sub    $0x8,%esp
    212d:	68 5d 4c 00 00       	push   $0x4c5d
    2132:	68 ee 4b 00 00       	push   $0x4bee
    2137:	e8 ea 1a 00 00       	call   3c26 <link>
    213c:	83 c4 10             	add    $0x10,%esp
    213f:	85 c0                	test   %eax,%eax
    2141:	75 17                	jne    215a <subdir+0x4f9>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2143:	83 ec 08             	sub    $0x8,%esp
    2146:	68 8c 4c 00 00       	push   $0x4c8c
    214b:	6a 01                	push   $0x1
    214d:	e8 f6 1b 00 00       	call   3d48 <printf>
    2152:	83 c4 10             	add    $0x10,%esp
    exit();
    2155:	e8 6c 1a 00 00       	call   3bc6 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    215a:	83 ec 08             	sub    $0x8,%esp
    215d:	68 a4 4a 00 00       	push   $0x4aa4
    2162:	68 dc 49 00 00       	push   $0x49dc
    2167:	e8 ba 1a 00 00       	call   3c26 <link>
    216c:	83 c4 10             	add    $0x10,%esp
    216f:	85 c0                	test   %eax,%eax
    2171:	75 17                	jne    218a <subdir+0x529>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2173:	83 ec 08             	sub    $0x8,%esp
    2176:	68 b0 4c 00 00       	push   $0x4cb0
    217b:	6a 01                	push   $0x1
    217d:	e8 c6 1b 00 00       	call   3d48 <printf>
    2182:	83 c4 10             	add    $0x10,%esp
    exit();
    2185:	e8 3c 1a 00 00       	call   3bc6 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    218a:	83 ec 0c             	sub    $0xc,%esp
    218d:	68 c9 4b 00 00       	push   $0x4bc9
    2192:	e8 97 1a 00 00       	call   3c2e <mkdir>
    2197:	83 c4 10             	add    $0x10,%esp
    219a:	85 c0                	test   %eax,%eax
    219c:	75 17                	jne    21b5 <subdir+0x554>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    219e:	83 ec 08             	sub    $0x8,%esp
    21a1:	68 d2 4c 00 00       	push   $0x4cd2
    21a6:	6a 01                	push   $0x1
    21a8:	e8 9b 1b 00 00       	call   3d48 <printf>
    21ad:	83 c4 10             	add    $0x10,%esp
    exit();
    21b0:	e8 11 1a 00 00       	call   3bc6 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    21b5:	83 ec 0c             	sub    $0xc,%esp
    21b8:	68 ee 4b 00 00       	push   $0x4bee
    21bd:	e8 6c 1a 00 00       	call   3c2e <mkdir>
    21c2:	83 c4 10             	add    $0x10,%esp
    21c5:	85 c0                	test   %eax,%eax
    21c7:	75 17                	jne    21e0 <subdir+0x57f>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    21c9:	83 ec 08             	sub    $0x8,%esp
    21cc:	68 ed 4c 00 00       	push   $0x4ced
    21d1:	6a 01                	push   $0x1
    21d3:	e8 70 1b 00 00       	call   3d48 <printf>
    21d8:	83 c4 10             	add    $0x10,%esp
    exit();
    21db:	e8 e6 19 00 00       	call   3bc6 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    21e0:	83 ec 0c             	sub    $0xc,%esp
    21e3:	68 a4 4a 00 00       	push   $0x4aa4
    21e8:	e8 41 1a 00 00       	call   3c2e <mkdir>
    21ed:	83 c4 10             	add    $0x10,%esp
    21f0:	85 c0                	test   %eax,%eax
    21f2:	75 17                	jne    220b <subdir+0x5aa>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    21f4:	83 ec 08             	sub    $0x8,%esp
    21f7:	68 08 4d 00 00       	push   $0x4d08
    21fc:	6a 01                	push   $0x1
    21fe:	e8 45 1b 00 00       	call   3d48 <printf>
    2203:	83 c4 10             	add    $0x10,%esp
    exit();
    2206:	e8 bb 19 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    220b:	83 ec 0c             	sub    $0xc,%esp
    220e:	68 ee 4b 00 00       	push   $0x4bee
    2213:	e8 fe 19 00 00       	call   3c16 <unlink>
    2218:	83 c4 10             	add    $0x10,%esp
    221b:	85 c0                	test   %eax,%eax
    221d:	75 17                	jne    2236 <subdir+0x5d5>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    221f:	83 ec 08             	sub    $0x8,%esp
    2222:	68 25 4d 00 00       	push   $0x4d25
    2227:	6a 01                	push   $0x1
    2229:	e8 1a 1b 00 00       	call   3d48 <printf>
    222e:	83 c4 10             	add    $0x10,%esp
    exit();
    2231:	e8 90 19 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    2236:	83 ec 0c             	sub    $0xc,%esp
    2239:	68 c9 4b 00 00       	push   $0x4bc9
    223e:	e8 d3 19 00 00       	call   3c16 <unlink>
    2243:	83 c4 10             	add    $0x10,%esp
    2246:	85 c0                	test   %eax,%eax
    2248:	75 17                	jne    2261 <subdir+0x600>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    224a:	83 ec 08             	sub    $0x8,%esp
    224d:	68 41 4d 00 00       	push   $0x4d41
    2252:	6a 01                	push   $0x1
    2254:	e8 ef 1a 00 00       	call   3d48 <printf>
    2259:	83 c4 10             	add    $0x10,%esp
    exit();
    225c:	e8 65 19 00 00       	call   3bc6 <exit>
  }
  if(chdir("dd/ff") == 0){
    2261:	83 ec 0c             	sub    $0xc,%esp
    2264:	68 dc 49 00 00       	push   $0x49dc
    2269:	e8 c8 19 00 00       	call   3c36 <chdir>
    226e:	83 c4 10             	add    $0x10,%esp
    2271:	85 c0                	test   %eax,%eax
    2273:	75 17                	jne    228c <subdir+0x62b>
    printf(1, "chdir dd/ff succeeded!\n");
    2275:	83 ec 08             	sub    $0x8,%esp
    2278:	68 5d 4d 00 00       	push   $0x4d5d
    227d:	6a 01                	push   $0x1
    227f:	e8 c4 1a 00 00       	call   3d48 <printf>
    2284:	83 c4 10             	add    $0x10,%esp
    exit();
    2287:	e8 3a 19 00 00       	call   3bc6 <exit>
  }
  if(chdir("dd/xx") == 0){
    228c:	83 ec 0c             	sub    $0xc,%esp
    228f:	68 75 4d 00 00       	push   $0x4d75
    2294:	e8 9d 19 00 00       	call   3c36 <chdir>
    2299:	83 c4 10             	add    $0x10,%esp
    229c:	85 c0                	test   %eax,%eax
    229e:	75 17                	jne    22b7 <subdir+0x656>
    printf(1, "chdir dd/xx succeeded!\n");
    22a0:	83 ec 08             	sub    $0x8,%esp
    22a3:	68 7b 4d 00 00       	push   $0x4d7b
    22a8:	6a 01                	push   $0x1
    22aa:	e8 99 1a 00 00       	call   3d48 <printf>
    22af:	83 c4 10             	add    $0x10,%esp
    exit();
    22b2:	e8 0f 19 00 00       	call   3bc6 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    22b7:	83 ec 0c             	sub    $0xc,%esp
    22ba:	68 a4 4a 00 00       	push   $0x4aa4
    22bf:	e8 52 19 00 00       	call   3c16 <unlink>
    22c4:	83 c4 10             	add    $0x10,%esp
    22c7:	85 c0                	test   %eax,%eax
    22c9:	74 17                	je     22e2 <subdir+0x681>
    printf(1, "unlink dd/dd/ff failed\n");
    22cb:	83 ec 08             	sub    $0x8,%esp
    22ce:	68 d1 4a 00 00       	push   $0x4ad1
    22d3:	6a 01                	push   $0x1
    22d5:	e8 6e 1a 00 00       	call   3d48 <printf>
    22da:	83 c4 10             	add    $0x10,%esp
    exit();
    22dd:	e8 e4 18 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd/ff") != 0){
    22e2:	83 ec 0c             	sub    $0xc,%esp
    22e5:	68 dc 49 00 00       	push   $0x49dc
    22ea:	e8 27 19 00 00       	call   3c16 <unlink>
    22ef:	83 c4 10             	add    $0x10,%esp
    22f2:	85 c0                	test   %eax,%eax
    22f4:	74 17                	je     230d <subdir+0x6ac>
    printf(1, "unlink dd/ff failed\n");
    22f6:	83 ec 08             	sub    $0x8,%esp
    22f9:	68 93 4d 00 00       	push   $0x4d93
    22fe:	6a 01                	push   $0x1
    2300:	e8 43 1a 00 00       	call   3d48 <printf>
    2305:	83 c4 10             	add    $0x10,%esp
    exit();
    2308:	e8 b9 18 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd") == 0){
    230d:	83 ec 0c             	sub    $0xc,%esp
    2310:	68 c1 49 00 00       	push   $0x49c1
    2315:	e8 fc 18 00 00       	call   3c16 <unlink>
    231a:	83 c4 10             	add    $0x10,%esp
    231d:	85 c0                	test   %eax,%eax
    231f:	75 17                	jne    2338 <subdir+0x6d7>
    printf(1, "unlink non-empty dd succeeded!\n");
    2321:	83 ec 08             	sub    $0x8,%esp
    2324:	68 a8 4d 00 00       	push   $0x4da8
    2329:	6a 01                	push   $0x1
    232b:	e8 18 1a 00 00       	call   3d48 <printf>
    2330:	83 c4 10             	add    $0x10,%esp
    exit();
    2333:	e8 8e 18 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd/dd") < 0){
    2338:	83 ec 0c             	sub    $0xc,%esp
    233b:	68 c8 4d 00 00       	push   $0x4dc8
    2340:	e8 d1 18 00 00       	call   3c16 <unlink>
    2345:	83 c4 10             	add    $0x10,%esp
    2348:	85 c0                	test   %eax,%eax
    234a:	79 17                	jns    2363 <subdir+0x702>
    printf(1, "unlink dd/dd failed\n");
    234c:	83 ec 08             	sub    $0x8,%esp
    234f:	68 ce 4d 00 00       	push   $0x4dce
    2354:	6a 01                	push   $0x1
    2356:	e8 ed 19 00 00       	call   3d48 <printf>
    235b:	83 c4 10             	add    $0x10,%esp
    exit();
    235e:	e8 63 18 00 00       	call   3bc6 <exit>
  }
  if(unlink("dd") < 0){
    2363:	83 ec 0c             	sub    $0xc,%esp
    2366:	68 c1 49 00 00       	push   $0x49c1
    236b:	e8 a6 18 00 00       	call   3c16 <unlink>
    2370:	83 c4 10             	add    $0x10,%esp
    2373:	85 c0                	test   %eax,%eax
    2375:	79 17                	jns    238e <subdir+0x72d>
    printf(1, "unlink dd failed\n");
    2377:	83 ec 08             	sub    $0x8,%esp
    237a:	68 e3 4d 00 00       	push   $0x4de3
    237f:	6a 01                	push   $0x1
    2381:	e8 c2 19 00 00       	call   3d48 <printf>
    2386:	83 c4 10             	add    $0x10,%esp
    exit();
    2389:	e8 38 18 00 00       	call   3bc6 <exit>
  }

  printf(1, "subdir ok\n");
    238e:	83 ec 08             	sub    $0x8,%esp
    2391:	68 f5 4d 00 00       	push   $0x4df5
    2396:	6a 01                	push   $0x1
    2398:	e8 ab 19 00 00       	call   3d48 <printf>
    239d:	83 c4 10             	add    $0x10,%esp
}
    23a0:	c9                   	leave  
    23a1:	c3                   	ret    

000023a2 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    23a2:	55                   	push   %ebp
    23a3:	89 e5                	mov    %esp,%ebp
    23a5:	83 ec 18             	sub    $0x18,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    23a8:	83 ec 08             	sub    $0x8,%esp
    23ab:	68 00 4e 00 00       	push   $0x4e00
    23b0:	6a 01                	push   $0x1
    23b2:	e8 91 19 00 00       	call   3d48 <printf>
    23b7:	83 c4 10             	add    $0x10,%esp

  unlink("bigwrite");
    23ba:	83 ec 0c             	sub    $0xc,%esp
    23bd:	68 0f 4e 00 00       	push   $0x4e0f
    23c2:	e8 4f 18 00 00       	call   3c16 <unlink>
    23c7:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    23ca:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    23d1:	e9 a7 00 00 00       	jmp    247d <bigwrite+0xdb>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    23d6:	83 ec 08             	sub    $0x8,%esp
    23d9:	68 02 02 00 00       	push   $0x202
    23de:	68 0f 4e 00 00       	push   $0x4e0f
    23e3:	e8 1e 18 00 00       	call   3c06 <open>
    23e8:	83 c4 10             	add    $0x10,%esp
    23eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    23ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    23f2:	79 17                	jns    240b <bigwrite+0x69>
      printf(1, "cannot create bigwrite\n");
    23f4:	83 ec 08             	sub    $0x8,%esp
    23f7:	68 18 4e 00 00       	push   $0x4e18
    23fc:	6a 01                	push   $0x1
    23fe:	e8 45 19 00 00       	call   3d48 <printf>
    2403:	83 c4 10             	add    $0x10,%esp
      exit();
    2406:	e8 bb 17 00 00       	call   3bc6 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    240b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2412:	eb 3e                	jmp    2452 <bigwrite+0xb0>
      int cc = write(fd, buf, sz);
    2414:	83 ec 04             	sub    $0x4,%esp
    2417:	ff 75 f4             	pushl  -0xc(%ebp)
    241a:	68 40 86 00 00       	push   $0x8640
    241f:	ff 75 ec             	pushl  -0x14(%ebp)
    2422:	e8 bf 17 00 00       	call   3be6 <write>
    2427:	83 c4 10             	add    $0x10,%esp
    242a:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    242d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2430:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2433:	74 1a                	je     244f <bigwrite+0xad>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2435:	ff 75 e8             	pushl  -0x18(%ebp)
    2438:	ff 75 f4             	pushl  -0xc(%ebp)
    243b:	68 30 4e 00 00       	push   $0x4e30
    2440:	6a 01                	push   $0x1
    2442:	e8 01 19 00 00       	call   3d48 <printf>
    2447:	83 c4 10             	add    $0x10,%esp
        exit();
    244a:	e8 77 17 00 00       	call   3bc6 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    244f:	ff 45 f0             	incl   -0x10(%ebp)
    2452:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2456:	7e bc                	jle    2414 <bigwrite+0x72>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2458:	83 ec 0c             	sub    $0xc,%esp
    245b:	ff 75 ec             	pushl  -0x14(%ebp)
    245e:	e8 8b 17 00 00       	call   3bee <close>
    2463:	83 c4 10             	add    $0x10,%esp
    unlink("bigwrite");
    2466:	83 ec 0c             	sub    $0xc,%esp
    2469:	68 0f 4e 00 00       	push   $0x4e0f
    246e:	e8 a3 17 00 00       	call   3c16 <unlink>
    2473:	83 c4 10             	add    $0x10,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2476:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    247d:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    2484:	0f 8e 4c ff ff ff    	jle    23d6 <bigwrite+0x34>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    248a:	83 ec 08             	sub    $0x8,%esp
    248d:	68 42 4e 00 00       	push   $0x4e42
    2492:	6a 01                	push   $0x1
    2494:	e8 af 18 00 00       	call   3d48 <printf>
    2499:	83 c4 10             	add    $0x10,%esp
}
    249c:	c9                   	leave  
    249d:	c3                   	ret    

0000249e <bigfile>:

void
bigfile(void)
{
    249e:	55                   	push   %ebp
    249f:	89 e5                	mov    %esp,%ebp
    24a1:	83 ec 18             	sub    $0x18,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24a4:	83 ec 08             	sub    $0x8,%esp
    24a7:	68 4f 4e 00 00       	push   $0x4e4f
    24ac:	6a 01                	push   $0x1
    24ae:	e8 95 18 00 00       	call   3d48 <printf>
    24b3:	83 c4 10             	add    $0x10,%esp

  unlink("bigfile");
    24b6:	83 ec 0c             	sub    $0xc,%esp
    24b9:	68 5d 4e 00 00       	push   $0x4e5d
    24be:	e8 53 17 00 00       	call   3c16 <unlink>
    24c3:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    24c6:	83 ec 08             	sub    $0x8,%esp
    24c9:	68 02 02 00 00       	push   $0x202
    24ce:	68 5d 4e 00 00       	push   $0x4e5d
    24d3:	e8 2e 17 00 00       	call   3c06 <open>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    24de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    24e2:	79 17                	jns    24fb <bigfile+0x5d>
    printf(1, "cannot create bigfile");
    24e4:	83 ec 08             	sub    $0x8,%esp
    24e7:	68 65 4e 00 00       	push   $0x4e65
    24ec:	6a 01                	push   $0x1
    24ee:	e8 55 18 00 00       	call   3d48 <printf>
    24f3:	83 c4 10             	add    $0x10,%esp
    exit();
    24f6:	e8 cb 16 00 00       	call   3bc6 <exit>
  }
  for(i = 0; i < 20; i++){
    24fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2502:	eb 51                	jmp    2555 <bigfile+0xb7>
    memset(buf, i, 600);
    2504:	83 ec 04             	sub    $0x4,%esp
    2507:	68 58 02 00 00       	push   $0x258
    250c:	ff 75 f4             	pushl  -0xc(%ebp)
    250f:	68 40 86 00 00       	push   $0x8640
    2514:	e8 1f 15 00 00       	call   3a38 <memset>
    2519:	83 c4 10             	add    $0x10,%esp
    if(write(fd, buf, 600) != 600){
    251c:	83 ec 04             	sub    $0x4,%esp
    251f:	68 58 02 00 00       	push   $0x258
    2524:	68 40 86 00 00       	push   $0x8640
    2529:	ff 75 ec             	pushl  -0x14(%ebp)
    252c:	e8 b5 16 00 00       	call   3be6 <write>
    2531:	83 c4 10             	add    $0x10,%esp
    2534:	3d 58 02 00 00       	cmp    $0x258,%eax
    2539:	74 17                	je     2552 <bigfile+0xb4>
      printf(1, "write bigfile failed\n");
    253b:	83 ec 08             	sub    $0x8,%esp
    253e:	68 7b 4e 00 00       	push   $0x4e7b
    2543:	6a 01                	push   $0x1
    2545:	e8 fe 17 00 00       	call   3d48 <printf>
    254a:	83 c4 10             	add    $0x10,%esp
      exit();
    254d:	e8 74 16 00 00       	call   3bc6 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    2552:	ff 45 f4             	incl   -0xc(%ebp)
    2555:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    2559:	7e a9                	jle    2504 <bigfile+0x66>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    255b:	83 ec 0c             	sub    $0xc,%esp
    255e:	ff 75 ec             	pushl  -0x14(%ebp)
    2561:	e8 88 16 00 00       	call   3bee <close>
    2566:	83 c4 10             	add    $0x10,%esp

  fd = open("bigfile", 0);
    2569:	83 ec 08             	sub    $0x8,%esp
    256c:	6a 00                	push   $0x0
    256e:	68 5d 4e 00 00       	push   $0x4e5d
    2573:	e8 8e 16 00 00       	call   3c06 <open>
    2578:	83 c4 10             	add    $0x10,%esp
    257b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    257e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2582:	79 17                	jns    259b <bigfile+0xfd>
    printf(1, "cannot open bigfile\n");
    2584:	83 ec 08             	sub    $0x8,%esp
    2587:	68 91 4e 00 00       	push   $0x4e91
    258c:	6a 01                	push   $0x1
    258e:	e8 b5 17 00 00       	call   3d48 <printf>
    2593:	83 c4 10             	add    $0x10,%esp
    exit();
    2596:	e8 2b 16 00 00       	call   3bc6 <exit>
  }
  total = 0;
    259b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    25a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    25a9:	83 ec 04             	sub    $0x4,%esp
    25ac:	68 2c 01 00 00       	push   $0x12c
    25b1:	68 40 86 00 00       	push   $0x8640
    25b6:	ff 75 ec             	pushl  -0x14(%ebp)
    25b9:	e8 20 16 00 00       	call   3bde <read>
    25be:	83 c4 10             	add    $0x10,%esp
    25c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    25c4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    25c8:	79 17                	jns    25e1 <bigfile+0x143>
      printf(1, "read bigfile failed\n");
    25ca:	83 ec 08             	sub    $0x8,%esp
    25cd:	68 a6 4e 00 00       	push   $0x4ea6
    25d2:	6a 01                	push   $0x1
    25d4:	e8 6f 17 00 00       	call   3d48 <printf>
    25d9:	83 c4 10             	add    $0x10,%esp
      exit();
    25dc:	e8 e5 15 00 00       	call   3bc6 <exit>
    }
    if(cc == 0)
    25e1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    25e5:	75 1e                	jne    2605 <bigfile+0x167>
      break;
    25e7:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25e8:	83 ec 0c             	sub    $0xc,%esp
    25eb:	ff 75 ec             	pushl  -0x14(%ebp)
    25ee:	e8 fb 15 00 00       	call   3bee <close>
    25f3:	83 c4 10             	add    $0x10,%esp
  if(total != 20*600){
    25f6:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    25fd:	0f 84 8e 00 00 00    	je     2691 <bigfile+0x1f3>
    2603:	eb 75                	jmp    267a <bigfile+0x1dc>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2605:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    260c:	74 17                	je     2625 <bigfile+0x187>
      printf(1, "short read bigfile\n");
    260e:	83 ec 08             	sub    $0x8,%esp
    2611:	68 bb 4e 00 00       	push   $0x4ebb
    2616:	6a 01                	push   $0x1
    2618:	e8 2b 17 00 00       	call   3d48 <printf>
    261d:	83 c4 10             	add    $0x10,%esp
      exit();
    2620:	e8 a1 15 00 00       	call   3bc6 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2625:	a0 40 86 00 00       	mov    0x8640,%al
    262a:	0f be d0             	movsbl %al,%edx
    262d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2630:	89 c1                	mov    %eax,%ecx
    2632:	c1 e9 1f             	shr    $0x1f,%ecx
    2635:	01 c8                	add    %ecx,%eax
    2637:	d1 f8                	sar    %eax
    2639:	39 c2                	cmp    %eax,%edx
    263b:	75 18                	jne    2655 <bigfile+0x1b7>
    263d:	a0 6b 87 00 00       	mov    0x876b,%al
    2642:	0f be d0             	movsbl %al,%edx
    2645:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2648:	89 c1                	mov    %eax,%ecx
    264a:	c1 e9 1f             	shr    $0x1f,%ecx
    264d:	01 c8                	add    %ecx,%eax
    264f:	d1 f8                	sar    %eax
    2651:	39 c2                	cmp    %eax,%edx
    2653:	74 17                	je     266c <bigfile+0x1ce>
      printf(1, "read bigfile wrong data\n");
    2655:	83 ec 08             	sub    $0x8,%esp
    2658:	68 cf 4e 00 00       	push   $0x4ecf
    265d:	6a 01                	push   $0x1
    265f:	e8 e4 16 00 00       	call   3d48 <printf>
    2664:	83 c4 10             	add    $0x10,%esp
      exit();
    2667:	e8 5a 15 00 00       	call   3bc6 <exit>
    }
    total += cc;
    266c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    266f:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2672:	ff 45 f4             	incl   -0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    2675:	e9 2f ff ff ff       	jmp    25a9 <bigfile+0x10b>
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    267a:	83 ec 08             	sub    $0x8,%esp
    267d:	68 e8 4e 00 00       	push   $0x4ee8
    2682:	6a 01                	push   $0x1
    2684:	e8 bf 16 00 00       	call   3d48 <printf>
    2689:	83 c4 10             	add    $0x10,%esp
    exit();
    268c:	e8 35 15 00 00       	call   3bc6 <exit>
  }
  unlink("bigfile");
    2691:	83 ec 0c             	sub    $0xc,%esp
    2694:	68 5d 4e 00 00       	push   $0x4e5d
    2699:	e8 78 15 00 00       	call   3c16 <unlink>
    269e:	83 c4 10             	add    $0x10,%esp

  printf(1, "bigfile test ok\n");
    26a1:	83 ec 08             	sub    $0x8,%esp
    26a4:	68 02 4f 00 00       	push   $0x4f02
    26a9:	6a 01                	push   $0x1
    26ab:	e8 98 16 00 00       	call   3d48 <printf>
    26b0:	83 c4 10             	add    $0x10,%esp
}
    26b3:	c9                   	leave  
    26b4:	c3                   	ret    

000026b5 <fourteen>:

void
fourteen(void)
{
    26b5:	55                   	push   %ebp
    26b6:	89 e5                	mov    %esp,%ebp
    26b8:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    26bb:	83 ec 08             	sub    $0x8,%esp
    26be:	68 13 4f 00 00       	push   $0x4f13
    26c3:	6a 01                	push   $0x1
    26c5:	e8 7e 16 00 00       	call   3d48 <printf>
    26ca:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234") != 0){
    26cd:	83 ec 0c             	sub    $0xc,%esp
    26d0:	68 22 4f 00 00       	push   $0x4f22
    26d5:	e8 54 15 00 00       	call   3c2e <mkdir>
    26da:	83 c4 10             	add    $0x10,%esp
    26dd:	85 c0                	test   %eax,%eax
    26df:	74 17                	je     26f8 <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 31 4f 00 00       	push   $0x4f31
    26e9:	6a 01                	push   $0x1
    26eb:	e8 58 16 00 00       	call   3d48 <printf>
    26f0:	83 c4 10             	add    $0x10,%esp
    exit();
    26f3:	e8 ce 14 00 00       	call   3bc6 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26f8:	83 ec 0c             	sub    $0xc,%esp
    26fb:	68 50 4f 00 00       	push   $0x4f50
    2700:	e8 29 15 00 00       	call   3c2e <mkdir>
    2705:	83 c4 10             	add    $0x10,%esp
    2708:	85 c0                	test   %eax,%eax
    270a:	74 17                	je     2723 <fourteen+0x6e>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    270c:	83 ec 08             	sub    $0x8,%esp
    270f:	68 70 4f 00 00       	push   $0x4f70
    2714:	6a 01                	push   $0x1
    2716:	e8 2d 16 00 00       	call   3d48 <printf>
    271b:	83 c4 10             	add    $0x10,%esp
    exit();
    271e:	e8 a3 14 00 00       	call   3bc6 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2723:	83 ec 08             	sub    $0x8,%esp
    2726:	68 00 02 00 00       	push   $0x200
    272b:	68 a0 4f 00 00       	push   $0x4fa0
    2730:	e8 d1 14 00 00       	call   3c06 <open>
    2735:	83 c4 10             	add    $0x10,%esp
    2738:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    273b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    273f:	79 17                	jns    2758 <fourteen+0xa3>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2741:	83 ec 08             	sub    $0x8,%esp
    2744:	68 d0 4f 00 00       	push   $0x4fd0
    2749:	6a 01                	push   $0x1
    274b:	e8 f8 15 00 00       	call   3d48 <printf>
    2750:	83 c4 10             	add    $0x10,%esp
    exit();
    2753:	e8 6e 14 00 00       	call   3bc6 <exit>
  }
  close(fd);
    2758:	83 ec 0c             	sub    $0xc,%esp
    275b:	ff 75 f4             	pushl  -0xc(%ebp)
    275e:	e8 8b 14 00 00       	call   3bee <close>
    2763:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2766:	83 ec 08             	sub    $0x8,%esp
    2769:	6a 00                	push   $0x0
    276b:	68 10 50 00 00       	push   $0x5010
    2770:	e8 91 14 00 00       	call   3c06 <open>
    2775:	83 c4 10             	add    $0x10,%esp
    2778:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    277b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    277f:	79 17                	jns    2798 <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2781:	83 ec 08             	sub    $0x8,%esp
    2784:	68 40 50 00 00       	push   $0x5040
    2789:	6a 01                	push   $0x1
    278b:	e8 b8 15 00 00       	call   3d48 <printf>
    2790:	83 c4 10             	add    $0x10,%esp
    exit();
    2793:	e8 2e 14 00 00       	call   3bc6 <exit>
  }
  close(fd);
    2798:	83 ec 0c             	sub    $0xc,%esp
    279b:	ff 75 f4             	pushl  -0xc(%ebp)
    279e:	e8 4b 14 00 00       	call   3bee <close>
    27a3:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234/12345678901234") == 0){
    27a6:	83 ec 0c             	sub    $0xc,%esp
    27a9:	68 7a 50 00 00       	push   $0x507a
    27ae:	e8 7b 14 00 00       	call   3c2e <mkdir>
    27b3:	83 c4 10             	add    $0x10,%esp
    27b6:	85 c0                	test   %eax,%eax
    27b8:	75 17                	jne    27d1 <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27ba:	83 ec 08             	sub    $0x8,%esp
    27bd:	68 98 50 00 00       	push   $0x5098
    27c2:	6a 01                	push   $0x1
    27c4:	e8 7f 15 00 00       	call   3d48 <printf>
    27c9:	83 c4 10             	add    $0x10,%esp
    exit();
    27cc:	e8 f5 13 00 00       	call   3bc6 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    27d1:	83 ec 0c             	sub    $0xc,%esp
    27d4:	68 c8 50 00 00       	push   $0x50c8
    27d9:	e8 50 14 00 00       	call   3c2e <mkdir>
    27de:	83 c4 10             	add    $0x10,%esp
    27e1:	85 c0                	test   %eax,%eax
    27e3:	75 17                	jne    27fc <fourteen+0x147>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    27e5:	83 ec 08             	sub    $0x8,%esp
    27e8:	68 e8 50 00 00       	push   $0x50e8
    27ed:	6a 01                	push   $0x1
    27ef:	e8 54 15 00 00       	call   3d48 <printf>
    27f4:	83 c4 10             	add    $0x10,%esp
    exit();
    27f7:	e8 ca 13 00 00       	call   3bc6 <exit>
  }

  printf(1, "fourteen ok\n");
    27fc:	83 ec 08             	sub    $0x8,%esp
    27ff:	68 19 51 00 00       	push   $0x5119
    2804:	6a 01                	push   $0x1
    2806:	e8 3d 15 00 00       	call   3d48 <printf>
    280b:	83 c4 10             	add    $0x10,%esp
}
    280e:	c9                   	leave  
    280f:	c3                   	ret    

00002810 <rmdot>:

void
rmdot(void)
{
    2810:	55                   	push   %ebp
    2811:	89 e5                	mov    %esp,%ebp
    2813:	83 ec 08             	sub    $0x8,%esp
  printf(1, "rmdot test\n");
    2816:	83 ec 08             	sub    $0x8,%esp
    2819:	68 26 51 00 00       	push   $0x5126
    281e:	6a 01                	push   $0x1
    2820:	e8 23 15 00 00       	call   3d48 <printf>
    2825:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dots") != 0){
    2828:	83 ec 0c             	sub    $0xc,%esp
    282b:	68 32 51 00 00       	push   $0x5132
    2830:	e8 f9 13 00 00       	call   3c2e <mkdir>
    2835:	83 c4 10             	add    $0x10,%esp
    2838:	85 c0                	test   %eax,%eax
    283a:	74 17                	je     2853 <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    283c:	83 ec 08             	sub    $0x8,%esp
    283f:	68 37 51 00 00       	push   $0x5137
    2844:	6a 01                	push   $0x1
    2846:	e8 fd 14 00 00       	call   3d48 <printf>
    284b:	83 c4 10             	add    $0x10,%esp
    exit();
    284e:	e8 73 13 00 00       	call   3bc6 <exit>
  }
  if(chdir("dots") != 0){
    2853:	83 ec 0c             	sub    $0xc,%esp
    2856:	68 32 51 00 00       	push   $0x5132
    285b:	e8 d6 13 00 00       	call   3c36 <chdir>
    2860:	83 c4 10             	add    $0x10,%esp
    2863:	85 c0                	test   %eax,%eax
    2865:	74 17                	je     287e <rmdot+0x6e>
    printf(1, "chdir dots failed\n");
    2867:	83 ec 08             	sub    $0x8,%esp
    286a:	68 4a 51 00 00       	push   $0x514a
    286f:	6a 01                	push   $0x1
    2871:	e8 d2 14 00 00       	call   3d48 <printf>
    2876:	83 c4 10             	add    $0x10,%esp
    exit();
    2879:	e8 48 13 00 00       	call   3bc6 <exit>
  }
  if(unlink(".") == 0){
    287e:	83 ec 0c             	sub    $0xc,%esp
    2881:	68 63 48 00 00       	push   $0x4863
    2886:	e8 8b 13 00 00       	call   3c16 <unlink>
    288b:	83 c4 10             	add    $0x10,%esp
    288e:	85 c0                	test   %eax,%eax
    2890:	75 17                	jne    28a9 <rmdot+0x99>
    printf(1, "rm . worked!\n");
    2892:	83 ec 08             	sub    $0x8,%esp
    2895:	68 5d 51 00 00       	push   $0x515d
    289a:	6a 01                	push   $0x1
    289c:	e8 a7 14 00 00       	call   3d48 <printf>
    28a1:	83 c4 10             	add    $0x10,%esp
    exit();
    28a4:	e8 1d 13 00 00       	call   3bc6 <exit>
  }
  if(unlink("..") == 0){
    28a9:	83 ec 0c             	sub    $0xc,%esp
    28ac:	68 f0 43 00 00       	push   $0x43f0
    28b1:	e8 60 13 00 00       	call   3c16 <unlink>
    28b6:	83 c4 10             	add    $0x10,%esp
    28b9:	85 c0                	test   %eax,%eax
    28bb:	75 17                	jne    28d4 <rmdot+0xc4>
    printf(1, "rm .. worked!\n");
    28bd:	83 ec 08             	sub    $0x8,%esp
    28c0:	68 6b 51 00 00       	push   $0x516b
    28c5:	6a 01                	push   $0x1
    28c7:	e8 7c 14 00 00       	call   3d48 <printf>
    28cc:	83 c4 10             	add    $0x10,%esp
    exit();
    28cf:	e8 f2 12 00 00       	call   3bc6 <exit>
  }
  if(chdir("/") != 0){
    28d4:	83 ec 0c             	sub    $0xc,%esp
    28d7:	68 7a 51 00 00       	push   $0x517a
    28dc:	e8 55 13 00 00       	call   3c36 <chdir>
    28e1:	83 c4 10             	add    $0x10,%esp
    28e4:	85 c0                	test   %eax,%eax
    28e6:	74 17                	je     28ff <rmdot+0xef>
    printf(1, "chdir / failed\n");
    28e8:	83 ec 08             	sub    $0x8,%esp
    28eb:	68 7c 51 00 00       	push   $0x517c
    28f0:	6a 01                	push   $0x1
    28f2:	e8 51 14 00 00       	call   3d48 <printf>
    28f7:	83 c4 10             	add    $0x10,%esp
    exit();
    28fa:	e8 c7 12 00 00       	call   3bc6 <exit>
  }
  if(unlink("dots/.") == 0){
    28ff:	83 ec 0c             	sub    $0xc,%esp
    2902:	68 8c 51 00 00       	push   $0x518c
    2907:	e8 0a 13 00 00       	call   3c16 <unlink>
    290c:	83 c4 10             	add    $0x10,%esp
    290f:	85 c0                	test   %eax,%eax
    2911:	75 17                	jne    292a <rmdot+0x11a>
    printf(1, "unlink dots/. worked!\n");
    2913:	83 ec 08             	sub    $0x8,%esp
    2916:	68 93 51 00 00       	push   $0x5193
    291b:	6a 01                	push   $0x1
    291d:	e8 26 14 00 00       	call   3d48 <printf>
    2922:	83 c4 10             	add    $0x10,%esp
    exit();
    2925:	e8 9c 12 00 00       	call   3bc6 <exit>
  }
  if(unlink("dots/..") == 0){
    292a:	83 ec 0c             	sub    $0xc,%esp
    292d:	68 aa 51 00 00       	push   $0x51aa
    2932:	e8 df 12 00 00       	call   3c16 <unlink>
    2937:	83 c4 10             	add    $0x10,%esp
    293a:	85 c0                	test   %eax,%eax
    293c:	75 17                	jne    2955 <rmdot+0x145>
    printf(1, "unlink dots/.. worked!\n");
    293e:	83 ec 08             	sub    $0x8,%esp
    2941:	68 b2 51 00 00       	push   $0x51b2
    2946:	6a 01                	push   $0x1
    2948:	e8 fb 13 00 00       	call   3d48 <printf>
    294d:	83 c4 10             	add    $0x10,%esp
    exit();
    2950:	e8 71 12 00 00       	call   3bc6 <exit>
  }
  if(unlink("dots") != 0){
    2955:	83 ec 0c             	sub    $0xc,%esp
    2958:	68 32 51 00 00       	push   $0x5132
    295d:	e8 b4 12 00 00       	call   3c16 <unlink>
    2962:	83 c4 10             	add    $0x10,%esp
    2965:	85 c0                	test   %eax,%eax
    2967:	74 17                	je     2980 <rmdot+0x170>
    printf(1, "unlink dots failed!\n");
    2969:	83 ec 08             	sub    $0x8,%esp
    296c:	68 ca 51 00 00       	push   $0x51ca
    2971:	6a 01                	push   $0x1
    2973:	e8 d0 13 00 00       	call   3d48 <printf>
    2978:	83 c4 10             	add    $0x10,%esp
    exit();
    297b:	e8 46 12 00 00       	call   3bc6 <exit>
  }
  printf(1, "rmdot ok\n");
    2980:	83 ec 08             	sub    $0x8,%esp
    2983:	68 df 51 00 00       	push   $0x51df
    2988:	6a 01                	push   $0x1
    298a:	e8 b9 13 00 00       	call   3d48 <printf>
    298f:	83 c4 10             	add    $0x10,%esp
}
    2992:	c9                   	leave  
    2993:	c3                   	ret    

00002994 <dirfile>:

void
dirfile(void)
{
    2994:	55                   	push   %ebp
    2995:	89 e5                	mov    %esp,%ebp
    2997:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "dir vs file\n");
    299a:	83 ec 08             	sub    $0x8,%esp
    299d:	68 e9 51 00 00       	push   $0x51e9
    29a2:	6a 01                	push   $0x1
    29a4:	e8 9f 13 00 00       	call   3d48 <printf>
    29a9:	83 c4 10             	add    $0x10,%esp

  fd = open("dirfile", O_CREATE);
    29ac:	83 ec 08             	sub    $0x8,%esp
    29af:	68 00 02 00 00       	push   $0x200
    29b4:	68 f6 51 00 00       	push   $0x51f6
    29b9:	e8 48 12 00 00       	call   3c06 <open>
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    29c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    29c8:	79 17                	jns    29e1 <dirfile+0x4d>
    printf(1, "create dirfile failed\n");
    29ca:	83 ec 08             	sub    $0x8,%esp
    29cd:	68 fe 51 00 00       	push   $0x51fe
    29d2:	6a 01                	push   $0x1
    29d4:	e8 6f 13 00 00       	call   3d48 <printf>
    29d9:	83 c4 10             	add    $0x10,%esp
    exit();
    29dc:	e8 e5 11 00 00       	call   3bc6 <exit>
  }
  close(fd);
    29e1:	83 ec 0c             	sub    $0xc,%esp
    29e4:	ff 75 f4             	pushl  -0xc(%ebp)
    29e7:	e8 02 12 00 00       	call   3bee <close>
    29ec:	83 c4 10             	add    $0x10,%esp
  if(chdir("dirfile") == 0){
    29ef:	83 ec 0c             	sub    $0xc,%esp
    29f2:	68 f6 51 00 00       	push   $0x51f6
    29f7:	e8 3a 12 00 00       	call   3c36 <chdir>
    29fc:	83 c4 10             	add    $0x10,%esp
    29ff:	85 c0                	test   %eax,%eax
    2a01:	75 17                	jne    2a1a <dirfile+0x86>
    printf(1, "chdir dirfile succeeded!\n");
    2a03:	83 ec 08             	sub    $0x8,%esp
    2a06:	68 15 52 00 00       	push   $0x5215
    2a0b:	6a 01                	push   $0x1
    2a0d:	e8 36 13 00 00       	call   3d48 <printf>
    2a12:	83 c4 10             	add    $0x10,%esp
    exit();
    2a15:	e8 ac 11 00 00       	call   3bc6 <exit>
  }
  fd = open("dirfile/xx", 0);
    2a1a:	83 ec 08             	sub    $0x8,%esp
    2a1d:	6a 00                	push   $0x0
    2a1f:	68 2f 52 00 00       	push   $0x522f
    2a24:	e8 dd 11 00 00       	call   3c06 <open>
    2a29:	83 c4 10             	add    $0x10,%esp
    2a2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2a2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a33:	78 17                	js     2a4c <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    2a35:	83 ec 08             	sub    $0x8,%esp
    2a38:	68 3a 52 00 00       	push   $0x523a
    2a3d:	6a 01                	push   $0x1
    2a3f:	e8 04 13 00 00       	call   3d48 <printf>
    2a44:	83 c4 10             	add    $0x10,%esp
    exit();
    2a47:	e8 7a 11 00 00       	call   3bc6 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2a4c:	83 ec 08             	sub    $0x8,%esp
    2a4f:	68 00 02 00 00       	push   $0x200
    2a54:	68 2f 52 00 00       	push   $0x522f
    2a59:	e8 a8 11 00 00       	call   3c06 <open>
    2a5e:	83 c4 10             	add    $0x10,%esp
    2a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2a64:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a68:	78 17                	js     2a81 <dirfile+0xed>
    printf(1, "create dirfile/xx succeeded!\n");
    2a6a:	83 ec 08             	sub    $0x8,%esp
    2a6d:	68 3a 52 00 00       	push   $0x523a
    2a72:	6a 01                	push   $0x1
    2a74:	e8 cf 12 00 00       	call   3d48 <printf>
    2a79:	83 c4 10             	add    $0x10,%esp
    exit();
    2a7c:	e8 45 11 00 00       	call   3bc6 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2a81:	83 ec 0c             	sub    $0xc,%esp
    2a84:	68 2f 52 00 00       	push   $0x522f
    2a89:	e8 a0 11 00 00       	call   3c2e <mkdir>
    2a8e:	83 c4 10             	add    $0x10,%esp
    2a91:	85 c0                	test   %eax,%eax
    2a93:	75 17                	jne    2aac <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2a95:	83 ec 08             	sub    $0x8,%esp
    2a98:	68 58 52 00 00       	push   $0x5258
    2a9d:	6a 01                	push   $0x1
    2a9f:	e8 a4 12 00 00       	call   3d48 <printf>
    2aa4:	83 c4 10             	add    $0x10,%esp
    exit();
    2aa7:	e8 1a 11 00 00       	call   3bc6 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2aac:	83 ec 0c             	sub    $0xc,%esp
    2aaf:	68 2f 52 00 00       	push   $0x522f
    2ab4:	e8 5d 11 00 00       	call   3c16 <unlink>
    2ab9:	83 c4 10             	add    $0x10,%esp
    2abc:	85 c0                	test   %eax,%eax
    2abe:	75 17                	jne    2ad7 <dirfile+0x143>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2ac0:	83 ec 08             	sub    $0x8,%esp
    2ac3:	68 75 52 00 00       	push   $0x5275
    2ac8:	6a 01                	push   $0x1
    2aca:	e8 79 12 00 00       	call   3d48 <printf>
    2acf:	83 c4 10             	add    $0x10,%esp
    exit();
    2ad2:	e8 ef 10 00 00       	call   3bc6 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2ad7:	83 ec 08             	sub    $0x8,%esp
    2ada:	68 2f 52 00 00       	push   $0x522f
    2adf:	68 93 52 00 00       	push   $0x5293
    2ae4:	e8 3d 11 00 00       	call   3c26 <link>
    2ae9:	83 c4 10             	add    $0x10,%esp
    2aec:	85 c0                	test   %eax,%eax
    2aee:	75 17                	jne    2b07 <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2af0:	83 ec 08             	sub    $0x8,%esp
    2af3:	68 9c 52 00 00       	push   $0x529c
    2af8:	6a 01                	push   $0x1
    2afa:	e8 49 12 00 00       	call   3d48 <printf>
    2aff:	83 c4 10             	add    $0x10,%esp
    exit();
    2b02:	e8 bf 10 00 00       	call   3bc6 <exit>
  }
  if(unlink("dirfile") != 0){
    2b07:	83 ec 0c             	sub    $0xc,%esp
    2b0a:	68 f6 51 00 00       	push   $0x51f6
    2b0f:	e8 02 11 00 00       	call   3c16 <unlink>
    2b14:	83 c4 10             	add    $0x10,%esp
    2b17:	85 c0                	test   %eax,%eax
    2b19:	74 17                	je     2b32 <dirfile+0x19e>
    printf(1, "unlink dirfile failed!\n");
    2b1b:	83 ec 08             	sub    $0x8,%esp
    2b1e:	68 bb 52 00 00       	push   $0x52bb
    2b23:	6a 01                	push   $0x1
    2b25:	e8 1e 12 00 00       	call   3d48 <printf>
    2b2a:	83 c4 10             	add    $0x10,%esp
    exit();
    2b2d:	e8 94 10 00 00       	call   3bc6 <exit>
  }

  fd = open(".", O_RDWR);
    2b32:	83 ec 08             	sub    $0x8,%esp
    2b35:	6a 02                	push   $0x2
    2b37:	68 63 48 00 00       	push   $0x4863
    2b3c:	e8 c5 10 00 00       	call   3c06 <open>
    2b41:	83 c4 10             	add    $0x10,%esp
    2b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2b47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b4b:	78 17                	js     2b64 <dirfile+0x1d0>
    printf(1, "open . for writing succeeded!\n");
    2b4d:	83 ec 08             	sub    $0x8,%esp
    2b50:	68 d4 52 00 00       	push   $0x52d4
    2b55:	6a 01                	push   $0x1
    2b57:	e8 ec 11 00 00       	call   3d48 <printf>
    2b5c:	83 c4 10             	add    $0x10,%esp
    exit();
    2b5f:	e8 62 10 00 00       	call   3bc6 <exit>
  }
  fd = open(".", 0);
    2b64:	83 ec 08             	sub    $0x8,%esp
    2b67:	6a 00                	push   $0x0
    2b69:	68 63 48 00 00       	push   $0x4863
    2b6e:	e8 93 10 00 00       	call   3c06 <open>
    2b73:	83 c4 10             	add    $0x10,%esp
    2b76:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2b79:	83 ec 04             	sub    $0x4,%esp
    2b7c:	6a 01                	push   $0x1
    2b7e:	68 9a 44 00 00       	push   $0x449a
    2b83:	ff 75 f4             	pushl  -0xc(%ebp)
    2b86:	e8 5b 10 00 00       	call   3be6 <write>
    2b8b:	83 c4 10             	add    $0x10,%esp
    2b8e:	85 c0                	test   %eax,%eax
    2b90:	7e 17                	jle    2ba9 <dirfile+0x215>
    printf(1, "write . succeeded!\n");
    2b92:	83 ec 08             	sub    $0x8,%esp
    2b95:	68 f3 52 00 00       	push   $0x52f3
    2b9a:	6a 01                	push   $0x1
    2b9c:	e8 a7 11 00 00       	call   3d48 <printf>
    2ba1:	83 c4 10             	add    $0x10,%esp
    exit();
    2ba4:	e8 1d 10 00 00       	call   3bc6 <exit>
  }
  close(fd);
    2ba9:	83 ec 0c             	sub    $0xc,%esp
    2bac:	ff 75 f4             	pushl  -0xc(%ebp)
    2baf:	e8 3a 10 00 00       	call   3bee <close>
    2bb4:	83 c4 10             	add    $0x10,%esp

  printf(1, "dir vs file OK\n");
    2bb7:	83 ec 08             	sub    $0x8,%esp
    2bba:	68 07 53 00 00       	push   $0x5307
    2bbf:	6a 01                	push   $0x1
    2bc1:	e8 82 11 00 00       	call   3d48 <printf>
    2bc6:	83 c4 10             	add    $0x10,%esp
}
    2bc9:	c9                   	leave  
    2bca:	c3                   	ret    

00002bcb <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2bcb:	55                   	push   %ebp
    2bcc:	89 e5                	mov    %esp,%ebp
    2bce:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2bd1:	83 ec 08             	sub    $0x8,%esp
    2bd4:	68 17 53 00 00       	push   $0x5317
    2bd9:	6a 01                	push   $0x1
    2bdb:	e8 68 11 00 00       	call   3d48 <printf>
    2be0:	83 c4 10             	add    $0x10,%esp

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2be3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2bea:	e9 e6 00 00 00       	jmp    2cd5 <iref+0x10a>
    if(mkdir("irefd") != 0){
    2bef:	83 ec 0c             	sub    $0xc,%esp
    2bf2:	68 28 53 00 00       	push   $0x5328
    2bf7:	e8 32 10 00 00       	call   3c2e <mkdir>
    2bfc:	83 c4 10             	add    $0x10,%esp
    2bff:	85 c0                	test   %eax,%eax
    2c01:	74 17                	je     2c1a <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2c03:	83 ec 08             	sub    $0x8,%esp
    2c06:	68 2e 53 00 00       	push   $0x532e
    2c0b:	6a 01                	push   $0x1
    2c0d:	e8 36 11 00 00       	call   3d48 <printf>
    2c12:	83 c4 10             	add    $0x10,%esp
      exit();
    2c15:	e8 ac 0f 00 00       	call   3bc6 <exit>
    }
    if(chdir("irefd") != 0){
    2c1a:	83 ec 0c             	sub    $0xc,%esp
    2c1d:	68 28 53 00 00       	push   $0x5328
    2c22:	e8 0f 10 00 00       	call   3c36 <chdir>
    2c27:	83 c4 10             	add    $0x10,%esp
    2c2a:	85 c0                	test   %eax,%eax
    2c2c:	74 17                	je     2c45 <iref+0x7a>
      printf(1, "chdir irefd failed\n");
    2c2e:	83 ec 08             	sub    $0x8,%esp
    2c31:	68 42 53 00 00       	push   $0x5342
    2c36:	6a 01                	push   $0x1
    2c38:	e8 0b 11 00 00       	call   3d48 <printf>
    2c3d:	83 c4 10             	add    $0x10,%esp
      exit();
    2c40:	e8 81 0f 00 00       	call   3bc6 <exit>
    }

    mkdir("");
    2c45:	83 ec 0c             	sub    $0xc,%esp
    2c48:	68 56 53 00 00       	push   $0x5356
    2c4d:	e8 dc 0f 00 00       	call   3c2e <mkdir>
    2c52:	83 c4 10             	add    $0x10,%esp
    link("README", "");
    2c55:	83 ec 08             	sub    $0x8,%esp
    2c58:	68 56 53 00 00       	push   $0x5356
    2c5d:	68 93 52 00 00       	push   $0x5293
    2c62:	e8 bf 0f 00 00       	call   3c26 <link>
    2c67:	83 c4 10             	add    $0x10,%esp
    fd = open("", O_CREATE);
    2c6a:	83 ec 08             	sub    $0x8,%esp
    2c6d:	68 00 02 00 00       	push   $0x200
    2c72:	68 56 53 00 00       	push   $0x5356
    2c77:	e8 8a 0f 00 00       	call   3c06 <open>
    2c7c:	83 c4 10             	add    $0x10,%esp
    2c7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2c82:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2c86:	78 0e                	js     2c96 <iref+0xcb>
      close(fd);
    2c88:	83 ec 0c             	sub    $0xc,%esp
    2c8b:	ff 75 f0             	pushl  -0x10(%ebp)
    2c8e:	e8 5b 0f 00 00       	call   3bee <close>
    2c93:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c96:	83 ec 08             	sub    $0x8,%esp
    2c99:	68 00 02 00 00       	push   $0x200
    2c9e:	68 57 53 00 00       	push   $0x5357
    2ca3:	e8 5e 0f 00 00       	call   3c06 <open>
    2ca8:	83 c4 10             	add    $0x10,%esp
    2cab:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2cae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2cb2:	78 0e                	js     2cc2 <iref+0xf7>
      close(fd);
    2cb4:	83 ec 0c             	sub    $0xc,%esp
    2cb7:	ff 75 f0             	pushl  -0x10(%ebp)
    2cba:	e8 2f 0f 00 00       	call   3bee <close>
    2cbf:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2cc2:	83 ec 0c             	sub    $0xc,%esp
    2cc5:	68 57 53 00 00       	push   $0x5357
    2cca:	e8 47 0f 00 00       	call   3c16 <unlink>
    2ccf:	83 c4 10             	add    $0x10,%esp
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2cd2:	ff 45 f4             	incl   -0xc(%ebp)
    2cd5:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    2cd9:	0f 8e 10 ff ff ff    	jle    2bef <iref+0x24>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2cdf:	83 ec 0c             	sub    $0xc,%esp
    2ce2:	68 7a 51 00 00       	push   $0x517a
    2ce7:	e8 4a 0f 00 00       	call   3c36 <chdir>
    2cec:	83 c4 10             	add    $0x10,%esp
  printf(1, "empty file name OK\n");
    2cef:	83 ec 08             	sub    $0x8,%esp
    2cf2:	68 5a 53 00 00       	push   $0x535a
    2cf7:	6a 01                	push   $0x1
    2cf9:	e8 4a 10 00 00       	call   3d48 <printf>
    2cfe:	83 c4 10             	add    $0x10,%esp
}
    2d01:	c9                   	leave  
    2d02:	c3                   	ret    

00002d03 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2d03:	55                   	push   %ebp
    2d04:	89 e5                	mov    %esp,%ebp
    2d06:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
    2d09:	83 ec 08             	sub    $0x8,%esp
    2d0c:	68 6e 53 00 00       	push   $0x536e
    2d11:	6a 01                	push   $0x1
    2d13:	e8 30 10 00 00       	call   3d48 <printf>
    2d18:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<1000; n++){
    2d1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2d22:	eb 1e                	jmp    2d42 <forktest+0x3f>
    pid = fork();
    2d24:	e8 95 0e 00 00       	call   3bbe <fork>
    2d29:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    2d2c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d30:	79 02                	jns    2d34 <forktest+0x31>
      break;
    2d32:	eb 17                	jmp    2d4b <forktest+0x48>
    if(pid == 0)
    2d34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d38:	75 05                	jne    2d3f <forktest+0x3c>
      exit();
    2d3a:	e8 87 0e 00 00       	call   3bc6 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2d3f:	ff 45 f4             	incl   -0xc(%ebp)
    2d42:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2d49:	7e d9                	jle    2d24 <forktest+0x21>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    2d4b:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    2d52:	75 17                	jne    2d6b <forktest+0x68>
    printf(1, "fork claimed to work 1000 times!\n");
    2d54:	83 ec 08             	sub    $0x8,%esp
    2d57:	68 7c 53 00 00       	push   $0x537c
    2d5c:	6a 01                	push   $0x1
    2d5e:	e8 e5 0f 00 00       	call   3d48 <printf>
    2d63:	83 c4 10             	add    $0x10,%esp
    exit();
    2d66:	e8 5b 0e 00 00       	call   3bc6 <exit>
  }
  
  for(; n > 0; n--){
    2d6b:	eb 23                	jmp    2d90 <forktest+0x8d>
    if(wait() < 0){
    2d6d:	e8 5c 0e 00 00       	call   3bce <wait>
    2d72:	85 c0                	test   %eax,%eax
    2d74:	79 17                	jns    2d8d <forktest+0x8a>
      printf(1, "wait stopped early\n");
    2d76:	83 ec 08             	sub    $0x8,%esp
    2d79:	68 9e 53 00 00       	push   $0x539e
    2d7e:	6a 01                	push   $0x1
    2d80:	e8 c3 0f 00 00       	call   3d48 <printf>
    2d85:	83 c4 10             	add    $0x10,%esp
      exit();
    2d88:	e8 39 0e 00 00       	call   3bc6 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2d8d:	ff 4d f4             	decl   -0xc(%ebp)
    2d90:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d94:	7f d7                	jg     2d6d <forktest+0x6a>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    2d96:	e8 33 0e 00 00       	call   3bce <wait>
    2d9b:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d9e:	74 17                	je     2db7 <forktest+0xb4>
    printf(1, "wait got too many\n");
    2da0:	83 ec 08             	sub    $0x8,%esp
    2da3:	68 b2 53 00 00       	push   $0x53b2
    2da8:	6a 01                	push   $0x1
    2daa:	e8 99 0f 00 00       	call   3d48 <printf>
    2daf:	83 c4 10             	add    $0x10,%esp
    exit();
    2db2:	e8 0f 0e 00 00       	call   3bc6 <exit>
  }
  
  printf(1, "fork test OK\n");
    2db7:	83 ec 08             	sub    $0x8,%esp
    2dba:	68 c5 53 00 00       	push   $0x53c5
    2dbf:	6a 01                	push   $0x1
    2dc1:	e8 82 0f 00 00       	call   3d48 <printf>
    2dc6:	83 c4 10             	add    $0x10,%esp
}
    2dc9:	c9                   	leave  
    2dca:	c3                   	ret    

00002dcb <sbrktest>:

void
sbrktest(void)
{
    2dcb:	55                   	push   %ebp
    2dcc:	89 e5                	mov    %esp,%ebp
    2dce:	53                   	push   %ebx
    2dcf:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2dd2:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2dd7:	83 ec 08             	sub    $0x8,%esp
    2dda:	68 d3 53 00 00       	push   $0x53d3
    2ddf:	50                   	push   %eax
    2de0:	e8 63 0f 00 00       	call   3d48 <printf>
    2de5:	83 c4 10             	add    $0x10,%esp
  oldbrk = sbrk(0);
    2de8:	83 ec 0c             	sub    $0xc,%esp
    2deb:	6a 00                	push   $0x0
    2ded:	e8 5c 0e 00 00       	call   3c4e <sbrk>
    2df2:	83 c4 10             	add    $0x10,%esp
    2df5:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2df8:	83 ec 0c             	sub    $0xc,%esp
    2dfb:	6a 00                	push   $0x0
    2dfd:	e8 4c 0e 00 00       	call   3c4e <sbrk>
    2e02:	83 c4 10             	add    $0x10,%esp
    2e05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    2e08:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2e0f:	eb 4c                	jmp    2e5d <sbrktest+0x92>
    b = sbrk(1);
    2e11:	83 ec 0c             	sub    $0xc,%esp
    2e14:	6a 01                	push   $0x1
    2e16:	e8 33 0e 00 00       	call   3c4e <sbrk>
    2e1b:	83 c4 10             	add    $0x10,%esp
    2e1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    2e21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e24:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2e27:	74 24                	je     2e4d <sbrktest+0x82>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2e29:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2e2e:	83 ec 0c             	sub    $0xc,%esp
    2e31:	ff 75 e8             	pushl  -0x18(%ebp)
    2e34:	ff 75 f4             	pushl  -0xc(%ebp)
    2e37:	ff 75 f0             	pushl  -0x10(%ebp)
    2e3a:	68 de 53 00 00       	push   $0x53de
    2e3f:	50                   	push   %eax
    2e40:	e8 03 0f 00 00       	call   3d48 <printf>
    2e45:	83 c4 20             	add    $0x20,%esp
      exit();
    2e48:	e8 79 0d 00 00       	call   3bc6 <exit>
    }
    *b = 1;
    2e4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e50:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2e53:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2e56:	40                   	inc    %eax
    2e57:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2e5a:	ff 45 f0             	incl   -0x10(%ebp)
    2e5d:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    2e64:	7e ab                	jle    2e11 <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2e66:	e8 53 0d 00 00       	call   3bbe <fork>
    2e6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2e6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2e72:	79 1b                	jns    2e8f <sbrktest+0xc4>
    printf(stdout, "sbrk test fork failed\n");
    2e74:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2e79:	83 ec 08             	sub    $0x8,%esp
    2e7c:	68 f9 53 00 00       	push   $0x53f9
    2e81:	50                   	push   %eax
    2e82:	e8 c1 0e 00 00       	call   3d48 <printf>
    2e87:	83 c4 10             	add    $0x10,%esp
    exit();
    2e8a:	e8 37 0d 00 00       	call   3bc6 <exit>
  }
  c = sbrk(1);
    2e8f:	83 ec 0c             	sub    $0xc,%esp
    2e92:	6a 01                	push   $0x1
    2e94:	e8 b5 0d 00 00       	call   3c4e <sbrk>
    2e99:	83 c4 10             	add    $0x10,%esp
    2e9c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    2e9f:	83 ec 0c             	sub    $0xc,%esp
    2ea2:	6a 01                	push   $0x1
    2ea4:	e8 a5 0d 00 00       	call   3c4e <sbrk>
    2ea9:	83 c4 10             	add    $0x10,%esp
    2eac:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    2eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eb2:	40                   	inc    %eax
    2eb3:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    2eb6:	74 1b                	je     2ed3 <sbrktest+0x108>
    printf(stdout, "sbrk test failed post-fork\n");
    2eb8:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2ebd:	83 ec 08             	sub    $0x8,%esp
    2ec0:	68 10 54 00 00       	push   $0x5410
    2ec5:	50                   	push   %eax
    2ec6:	e8 7d 0e 00 00       	call   3d48 <printf>
    2ecb:	83 c4 10             	add    $0x10,%esp
    exit();
    2ece:	e8 f3 0c 00 00       	call   3bc6 <exit>
  }
  if(pid == 0)
    2ed3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2ed7:	75 05                	jne    2ede <sbrktest+0x113>
    exit();
    2ed9:	e8 e8 0c 00 00       	call   3bc6 <exit>
  wait();
    2ede:	e8 eb 0c 00 00       	call   3bce <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2ee3:	83 ec 0c             	sub    $0xc,%esp
    2ee6:	6a 00                	push   $0x0
    2ee8:	e8 61 0d 00 00       	call   3c4e <sbrk>
    2eed:	83 c4 10             	add    $0x10,%esp
    2ef0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    2ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef6:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2efb:	29 c2                	sub    %eax,%edx
    2efd:	89 d0                	mov    %edx,%eax
    2eff:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    2f02:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2f05:	83 ec 0c             	sub    $0xc,%esp
    2f08:	50                   	push   %eax
    2f09:	e8 40 0d 00 00       	call   3c4e <sbrk>
    2f0e:	83 c4 10             	add    $0x10,%esp
    2f11:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    2f14:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2f17:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2f1a:	74 1b                	je     2f37 <sbrktest+0x16c>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2f1c:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2f21:	83 ec 08             	sub    $0x8,%esp
    2f24:	68 2c 54 00 00       	push   $0x542c
    2f29:	50                   	push   %eax
    2f2a:	e8 19 0e 00 00       	call   3d48 <printf>
    2f2f:	83 c4 10             	add    $0x10,%esp
    exit();
    2f32:	e8 8f 0c 00 00       	call   3bc6 <exit>
  }
  lastaddr = (char*) (BIG-1);
    2f37:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    2f3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2f41:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    2f44:	83 ec 0c             	sub    $0xc,%esp
    2f47:	6a 00                	push   $0x0
    2f49:	e8 00 0d 00 00       	call   3c4e <sbrk>
    2f4e:	83 c4 10             	add    $0x10,%esp
    2f51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    2f54:	83 ec 0c             	sub    $0xc,%esp
    2f57:	68 00 f0 ff ff       	push   $0xfffff000
    2f5c:	e8 ed 0c 00 00       	call   3c4e <sbrk>
    2f61:	83 c4 10             	add    $0x10,%esp
    2f64:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    2f67:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    2f6b:	75 1b                	jne    2f88 <sbrktest+0x1bd>
    printf(stdout, "sbrk could not deallocate\n");
    2f6d:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2f72:	83 ec 08             	sub    $0x8,%esp
    2f75:	68 6a 54 00 00       	push   $0x546a
    2f7a:	50                   	push   %eax
    2f7b:	e8 c8 0d 00 00       	call   3d48 <printf>
    2f80:	83 c4 10             	add    $0x10,%esp
    exit();
    2f83:	e8 3e 0c 00 00       	call   3bc6 <exit>
  }
  c = sbrk(0);
    2f88:	83 ec 0c             	sub    $0xc,%esp
    2f8b:	6a 00                	push   $0x0
    2f8d:	e8 bc 0c 00 00       	call   3c4e <sbrk>
    2f92:	83 c4 10             	add    $0x10,%esp
    2f95:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    2f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f9b:	2d 00 10 00 00       	sub    $0x1000,%eax
    2fa0:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    2fa3:	74 1e                	je     2fc3 <sbrktest+0x1f8>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2fa5:	a1 48 5e 00 00       	mov    0x5e48,%eax
    2faa:	ff 75 e0             	pushl  -0x20(%ebp)
    2fad:	ff 75 f4             	pushl  -0xc(%ebp)
    2fb0:	68 88 54 00 00       	push   $0x5488
    2fb5:	50                   	push   %eax
    2fb6:	e8 8d 0d 00 00       	call   3d48 <printf>
    2fbb:	83 c4 10             	add    $0x10,%esp
    exit();
    2fbe:	e8 03 0c 00 00       	call   3bc6 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2fc3:	83 ec 0c             	sub    $0xc,%esp
    2fc6:	6a 00                	push   $0x0
    2fc8:	e8 81 0c 00 00       	call   3c4e <sbrk>
    2fcd:	83 c4 10             	add    $0x10,%esp
    2fd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    2fd3:	83 ec 0c             	sub    $0xc,%esp
    2fd6:	68 00 10 00 00       	push   $0x1000
    2fdb:	e8 6e 0c 00 00       	call   3c4e <sbrk>
    2fe0:	83 c4 10             	add    $0x10,%esp
    2fe3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    2fe6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2fe9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2fec:	75 1a                	jne    3008 <sbrktest+0x23d>
    2fee:	83 ec 0c             	sub    $0xc,%esp
    2ff1:	6a 00                	push   $0x0
    2ff3:	e8 56 0c 00 00       	call   3c4e <sbrk>
    2ff8:	83 c4 10             	add    $0x10,%esp
    2ffb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ffe:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3004:	39 d0                	cmp    %edx,%eax
    3006:	74 1e                	je     3026 <sbrktest+0x25b>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3008:	a1 48 5e 00 00       	mov    0x5e48,%eax
    300d:	ff 75 e0             	pushl  -0x20(%ebp)
    3010:	ff 75 f4             	pushl  -0xc(%ebp)
    3013:	68 c0 54 00 00       	push   $0x54c0
    3018:	50                   	push   %eax
    3019:	e8 2a 0d 00 00       	call   3d48 <printf>
    301e:	83 c4 10             	add    $0x10,%esp
    exit();
    3021:	e8 a0 0b 00 00       	call   3bc6 <exit>
  }
  if(*lastaddr == 99){
    3026:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3029:	8a 00                	mov    (%eax),%al
    302b:	3c 63                	cmp    $0x63,%al
    302d:	75 1b                	jne    304a <sbrktest+0x27f>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    302f:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3034:	83 ec 08             	sub    $0x8,%esp
    3037:	68 e8 54 00 00       	push   $0x54e8
    303c:	50                   	push   %eax
    303d:	e8 06 0d 00 00       	call   3d48 <printf>
    3042:	83 c4 10             	add    $0x10,%esp
    exit();
    3045:	e8 7c 0b 00 00       	call   3bc6 <exit>
  }

  a = sbrk(0);
    304a:	83 ec 0c             	sub    $0xc,%esp
    304d:	6a 00                	push   $0x0
    304f:	e8 fa 0b 00 00       	call   3c4e <sbrk>
    3054:	83 c4 10             	add    $0x10,%esp
    3057:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    305a:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    305d:	83 ec 0c             	sub    $0xc,%esp
    3060:	6a 00                	push   $0x0
    3062:	e8 e7 0b 00 00       	call   3c4e <sbrk>
    3067:	83 c4 10             	add    $0x10,%esp
    306a:	29 c3                	sub    %eax,%ebx
    306c:	89 d8                	mov    %ebx,%eax
    306e:	83 ec 0c             	sub    $0xc,%esp
    3071:	50                   	push   %eax
    3072:	e8 d7 0b 00 00       	call   3c4e <sbrk>
    3077:	83 c4 10             	add    $0x10,%esp
    307a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    307d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3080:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3083:	74 1e                	je     30a3 <sbrktest+0x2d8>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3085:	a1 48 5e 00 00       	mov    0x5e48,%eax
    308a:	ff 75 e0             	pushl  -0x20(%ebp)
    308d:	ff 75 f4             	pushl  -0xc(%ebp)
    3090:	68 18 55 00 00       	push   $0x5518
    3095:	50                   	push   %eax
    3096:	e8 ad 0c 00 00       	call   3d48 <printf>
    309b:	83 c4 10             	add    $0x10,%esp
    exit();
    309e:	e8 23 0b 00 00       	call   3bc6 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    30a3:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    30aa:	eb 75                	jmp    3121 <sbrktest+0x356>
    ppid = getpid();
    30ac:	e8 95 0b 00 00       	call   3c46 <getpid>
    30b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    30b4:	e8 05 0b 00 00       	call   3bbe <fork>
    30b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    30bc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    30c0:	79 1b                	jns    30dd <sbrktest+0x312>
      printf(stdout, "fork failed\n");
    30c2:	a1 48 5e 00 00       	mov    0x5e48,%eax
    30c7:	83 ec 08             	sub    $0x8,%esp
    30ca:	68 e1 44 00 00       	push   $0x44e1
    30cf:	50                   	push   %eax
    30d0:	e8 73 0c 00 00       	call   3d48 <printf>
    30d5:	83 c4 10             	add    $0x10,%esp
      exit();
    30d8:	e8 e9 0a 00 00       	call   3bc6 <exit>
    }
    if(pid == 0){
    30dd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    30e1:	75 32                	jne    3115 <sbrktest+0x34a>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    30e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    30e6:	8a 00                	mov    (%eax),%al
    30e8:	0f be d0             	movsbl %al,%edx
    30eb:	a1 48 5e 00 00       	mov    0x5e48,%eax
    30f0:	52                   	push   %edx
    30f1:	ff 75 f4             	pushl  -0xc(%ebp)
    30f4:	68 39 55 00 00       	push   $0x5539
    30f9:	50                   	push   %eax
    30fa:	e8 49 0c 00 00       	call   3d48 <printf>
    30ff:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
    3102:	83 ec 0c             	sub    $0xc,%esp
    3105:	ff 75 d0             	pushl  -0x30(%ebp)
    3108:	e8 e9 0a 00 00       	call   3bf6 <kill>
    310d:	83 c4 10             	add    $0x10,%esp
      exit();
    3110:	e8 b1 0a 00 00       	call   3bc6 <exit>
    }
    wait();
    3115:	e8 b4 0a 00 00       	call   3bce <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    311a:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    3121:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    3128:	76 82                	jbe    30ac <sbrktest+0x2e1>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    312a:	83 ec 0c             	sub    $0xc,%esp
    312d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    3130:	50                   	push   %eax
    3131:	e8 a0 0a 00 00       	call   3bd6 <pipe>
    3136:	83 c4 10             	add    $0x10,%esp
    3139:	85 c0                	test   %eax,%eax
    313b:	74 17                	je     3154 <sbrktest+0x389>
    printf(1, "pipe() failed\n");
    313d:	83 ec 08             	sub    $0x8,%esp
    3140:	68 35 44 00 00       	push   $0x4435
    3145:	6a 01                	push   $0x1
    3147:	e8 fc 0b 00 00       	call   3d48 <printf>
    314c:	83 c4 10             	add    $0x10,%esp
    exit();
    314f:	e8 72 0a 00 00       	call   3bc6 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3154:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    315b:	e9 85 00 00 00       	jmp    31e5 <sbrktest+0x41a>
    if((pids[i] = fork()) == 0){
    3160:	e8 59 0a 00 00       	call   3bbe <fork>
    3165:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3168:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    316c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    316f:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3173:	85 c0                	test   %eax,%eax
    3175:	75 4a                	jne    31c1 <sbrktest+0x3f6>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3177:	83 ec 0c             	sub    $0xc,%esp
    317a:	6a 00                	push   $0x0
    317c:	e8 cd 0a 00 00       	call   3c4e <sbrk>
    3181:	83 c4 10             	add    $0x10,%esp
    3184:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3189:	29 c2                	sub    %eax,%edx
    318b:	89 d0                	mov    %edx,%eax
    318d:	83 ec 0c             	sub    $0xc,%esp
    3190:	50                   	push   %eax
    3191:	e8 b8 0a 00 00       	call   3c4e <sbrk>
    3196:	83 c4 10             	add    $0x10,%esp
      write(fds[1], "x", 1);
    3199:	8b 45 cc             	mov    -0x34(%ebp),%eax
    319c:	83 ec 04             	sub    $0x4,%esp
    319f:	6a 01                	push   $0x1
    31a1:	68 9a 44 00 00       	push   $0x449a
    31a6:	50                   	push   %eax
    31a7:	e8 3a 0a 00 00       	call   3be6 <write>
    31ac:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    31af:	83 ec 0c             	sub    $0xc,%esp
    31b2:	68 e8 03 00 00       	push   $0x3e8
    31b7:	e8 9a 0a 00 00       	call   3c56 <sleep>
    31bc:	83 c4 10             	add    $0x10,%esp
    31bf:	eb ee                	jmp    31af <sbrktest+0x3e4>
    }
    if(pids[i] != -1)
    31c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31c4:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    31c8:	83 f8 ff             	cmp    $0xffffffff,%eax
    31cb:	74 15                	je     31e2 <sbrktest+0x417>
      read(fds[0], &scratch, 1);
    31cd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    31d0:	83 ec 04             	sub    $0x4,%esp
    31d3:	6a 01                	push   $0x1
    31d5:	8d 55 9f             	lea    -0x61(%ebp),%edx
    31d8:	52                   	push   %edx
    31d9:	50                   	push   %eax
    31da:	e8 ff 09 00 00       	call   3bde <read>
    31df:	83 c4 10             	add    $0x10,%esp
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    31e2:	ff 45 f0             	incl   -0x10(%ebp)
    31e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31e8:	83 f8 09             	cmp    $0x9,%eax
    31eb:	0f 86 6f ff ff ff    	jbe    3160 <sbrktest+0x395>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    31f1:	83 ec 0c             	sub    $0xc,%esp
    31f4:	68 00 10 00 00       	push   $0x1000
    31f9:	e8 50 0a 00 00       	call   3c4e <sbrk>
    31fe:	83 c4 10             	add    $0x10,%esp
    3201:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3204:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    320b:	eb 29                	jmp    3236 <sbrktest+0x46b>
    if(pids[i] == -1)
    320d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3210:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3214:	83 f8 ff             	cmp    $0xffffffff,%eax
    3217:	75 02                	jne    321b <sbrktest+0x450>
      continue;
    3219:	eb 18                	jmp    3233 <sbrktest+0x468>
    kill(pids[i]);
    321b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    321e:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3222:	83 ec 0c             	sub    $0xc,%esp
    3225:	50                   	push   %eax
    3226:	e8 cb 09 00 00       	call   3bf6 <kill>
    322b:	83 c4 10             	add    $0x10,%esp
    wait();
    322e:	e8 9b 09 00 00       	call   3bce <wait>
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3233:	ff 45 f0             	incl   -0x10(%ebp)
    3236:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3239:	83 f8 09             	cmp    $0x9,%eax
    323c:	76 cf                	jbe    320d <sbrktest+0x442>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    323e:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3242:	75 1b                	jne    325f <sbrktest+0x494>
    printf(stdout, "failed sbrk leaked memory\n");
    3244:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3249:	83 ec 08             	sub    $0x8,%esp
    324c:	68 52 55 00 00       	push   $0x5552
    3251:	50                   	push   %eax
    3252:	e8 f1 0a 00 00       	call   3d48 <printf>
    3257:	83 c4 10             	add    $0x10,%esp
    exit();
    325a:	e8 67 09 00 00       	call   3bc6 <exit>
  }

  if(sbrk(0) > oldbrk)
    325f:	83 ec 0c             	sub    $0xc,%esp
    3262:	6a 00                	push   $0x0
    3264:	e8 e5 09 00 00       	call   3c4e <sbrk>
    3269:	83 c4 10             	add    $0x10,%esp
    326c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    326f:	76 20                	jbe    3291 <sbrktest+0x4c6>
    sbrk(-(sbrk(0) - oldbrk));
    3271:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3274:	83 ec 0c             	sub    $0xc,%esp
    3277:	6a 00                	push   $0x0
    3279:	e8 d0 09 00 00       	call   3c4e <sbrk>
    327e:	83 c4 10             	add    $0x10,%esp
    3281:	29 c3                	sub    %eax,%ebx
    3283:	89 d8                	mov    %ebx,%eax
    3285:	83 ec 0c             	sub    $0xc,%esp
    3288:	50                   	push   %eax
    3289:	e8 c0 09 00 00       	call   3c4e <sbrk>
    328e:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    3291:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3296:	83 ec 08             	sub    $0x8,%esp
    3299:	68 6d 55 00 00       	push   $0x556d
    329e:	50                   	push   %eax
    329f:	e8 a4 0a 00 00       	call   3d48 <printf>
    32a4:	83 c4 10             	add    $0x10,%esp
}
    32a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    32aa:	c9                   	leave  
    32ab:	c3                   	ret    

000032ac <validateint>:

void
validateint(int *p)
{
    32ac:	55                   	push   %ebp
    32ad:	89 e5                	mov    %esp,%ebp
    32af:	53                   	push   %ebx
    32b0:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    32b3:	b8 0d 00 00 00       	mov    $0xd,%eax
    32b8:	8b 55 08             	mov    0x8(%ebp),%edx
    32bb:	89 d1                	mov    %edx,%ecx
    32bd:	89 e3                	mov    %esp,%ebx
    32bf:	89 cc                	mov    %ecx,%esp
    32c1:	cd 40                	int    $0x40
    32c3:	89 dc                	mov    %ebx,%esp
    32c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    32c8:	83 c4 10             	add    $0x10,%esp
    32cb:	5b                   	pop    %ebx
    32cc:	5d                   	pop    %ebp
    32cd:	c3                   	ret    

000032ce <validatetest>:

void
validatetest(void)
{
    32ce:	55                   	push   %ebp
    32cf:	89 e5                	mov    %esp,%ebp
    32d1:	83 ec 18             	sub    $0x18,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    32d4:	a1 48 5e 00 00       	mov    0x5e48,%eax
    32d9:	83 ec 08             	sub    $0x8,%esp
    32dc:	68 7b 55 00 00       	push   $0x557b
    32e1:	50                   	push   %eax
    32e2:	e8 61 0a 00 00       	call   3d48 <printf>
    32e7:	83 c4 10             	add    $0x10,%esp
  hi = 1100*1024;
    32ea:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    32f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    32f8:	e9 8a 00 00 00       	jmp    3387 <validatetest+0xb9>
    if((pid = fork()) == 0){
    32fd:	e8 bc 08 00 00       	call   3bbe <fork>
    3302:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3305:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3309:	75 14                	jne    331f <validatetest+0x51>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    330b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    330e:	83 ec 0c             	sub    $0xc,%esp
    3311:	50                   	push   %eax
    3312:	e8 95 ff ff ff       	call   32ac <validateint>
    3317:	83 c4 10             	add    $0x10,%esp
      exit();
    331a:	e8 a7 08 00 00       	call   3bc6 <exit>
    }
    sleep(0);
    331f:	83 ec 0c             	sub    $0xc,%esp
    3322:	6a 00                	push   $0x0
    3324:	e8 2d 09 00 00       	call   3c56 <sleep>
    3329:	83 c4 10             	add    $0x10,%esp
    sleep(0);
    332c:	83 ec 0c             	sub    $0xc,%esp
    332f:	6a 00                	push   $0x0
    3331:	e8 20 09 00 00       	call   3c56 <sleep>
    3336:	83 c4 10             	add    $0x10,%esp
    kill(pid);
    3339:	83 ec 0c             	sub    $0xc,%esp
    333c:	ff 75 ec             	pushl  -0x14(%ebp)
    333f:	e8 b2 08 00 00       	call   3bf6 <kill>
    3344:	83 c4 10             	add    $0x10,%esp
    wait();
    3347:	e8 82 08 00 00       	call   3bce <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    334c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    334f:	83 ec 08             	sub    $0x8,%esp
    3352:	50                   	push   %eax
    3353:	68 8a 55 00 00       	push   $0x558a
    3358:	e8 c9 08 00 00       	call   3c26 <link>
    335d:	83 c4 10             	add    $0x10,%esp
    3360:	83 f8 ff             	cmp    $0xffffffff,%eax
    3363:	74 1b                	je     3380 <validatetest+0xb2>
      printf(stdout, "link should not succeed\n");
    3365:	a1 48 5e 00 00       	mov    0x5e48,%eax
    336a:	83 ec 08             	sub    $0x8,%esp
    336d:	68 95 55 00 00       	push   $0x5595
    3372:	50                   	push   %eax
    3373:	e8 d0 09 00 00       	call   3d48 <printf>
    3378:	83 c4 10             	add    $0x10,%esp
      exit();
    337b:	e8 46 08 00 00       	call   3bc6 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3380:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    3387:	8b 45 f0             	mov    -0x10(%ebp),%eax
    338a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    338d:	0f 83 6a ff ff ff    	jae    32fd <validatetest+0x2f>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3393:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3398:	83 ec 08             	sub    $0x8,%esp
    339b:	68 ae 55 00 00       	push   $0x55ae
    33a0:	50                   	push   %eax
    33a1:	e8 a2 09 00 00       	call   3d48 <printf>
    33a6:	83 c4 10             	add    $0x10,%esp
}
    33a9:	c9                   	leave  
    33aa:	c3                   	ret    

000033ab <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    33ab:	55                   	push   %ebp
    33ac:	89 e5                	mov    %esp,%ebp
    33ae:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    33b1:	a1 48 5e 00 00       	mov    0x5e48,%eax
    33b6:	83 ec 08             	sub    $0x8,%esp
    33b9:	68 bb 55 00 00       	push   $0x55bb
    33be:	50                   	push   %eax
    33bf:	e8 84 09 00 00       	call   3d48 <printf>
    33c4:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    33c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33ce:	eb 2c                	jmp    33fc <bsstest+0x51>
    if(uninit[i] != '\0'){
    33d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33d3:	05 20 5f 00 00       	add    $0x5f20,%eax
    33d8:	8a 00                	mov    (%eax),%al
    33da:	84 c0                	test   %al,%al
    33dc:	74 1b                	je     33f9 <bsstest+0x4e>
      printf(stdout, "bss test failed\n");
    33de:	a1 48 5e 00 00       	mov    0x5e48,%eax
    33e3:	83 ec 08             	sub    $0x8,%esp
    33e6:	68 c5 55 00 00       	push   $0x55c5
    33eb:	50                   	push   %eax
    33ec:	e8 57 09 00 00       	call   3d48 <printf>
    33f1:	83 c4 10             	add    $0x10,%esp
      exit();
    33f4:	e8 cd 07 00 00       	call   3bc6 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    33f9:	ff 45 f4             	incl   -0xc(%ebp)
    33fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33ff:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3404:	76 ca                	jbe    33d0 <bsstest+0x25>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    3406:	a1 48 5e 00 00       	mov    0x5e48,%eax
    340b:	83 ec 08             	sub    $0x8,%esp
    340e:	68 d6 55 00 00       	push   $0x55d6
    3413:	50                   	push   %eax
    3414:	e8 2f 09 00 00       	call   3d48 <printf>
    3419:	83 c4 10             	add    $0x10,%esp
}
    341c:	c9                   	leave  
    341d:	c3                   	ret    

0000341e <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    341e:	55                   	push   %ebp
    341f:	89 e5                	mov    %esp,%ebp
    3421:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3424:	83 ec 0c             	sub    $0xc,%esp
    3427:	68 e3 55 00 00       	push   $0x55e3
    342c:	e8 e5 07 00 00       	call   3c16 <unlink>
    3431:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    3434:	e8 85 07 00 00       	call   3bbe <fork>
    3439:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    343c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3440:	0f 85 96 00 00 00    	jne    34dc <bigargtest+0xbe>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3446:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    344d:	eb 11                	jmp    3460 <bigargtest+0x42>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    344f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3452:	c7 04 85 80 5e 00 00 	movl   $0x55f0,0x5e80(,%eax,4)
    3459:	f0 55 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    345d:	ff 45 f4             	incl   -0xc(%ebp)
    3460:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    3464:	7e e9                	jle    344f <bigargtest+0x31>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3466:	c7 05 fc 5e 00 00 00 	movl   $0x0,0x5efc
    346d:	00 00 00 
    printf(stdout, "bigarg test\n");
    3470:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3475:	83 ec 08             	sub    $0x8,%esp
    3478:	68 cd 56 00 00       	push   $0x56cd
    347d:	50                   	push   %eax
    347e:	e8 c5 08 00 00       	call   3d48 <printf>
    3483:	83 c4 10             	add    $0x10,%esp
    exec("echo", args);
    3486:	83 ec 08             	sub    $0x8,%esp
    3489:	68 80 5e 00 00       	push   $0x5e80
    348e:	68 f4 40 00 00       	push   $0x40f4
    3493:	e8 66 07 00 00       	call   3bfe <exec>
    3498:	83 c4 10             	add    $0x10,%esp
    printf(stdout, "bigarg test ok\n");
    349b:	a1 48 5e 00 00       	mov    0x5e48,%eax
    34a0:	83 ec 08             	sub    $0x8,%esp
    34a3:	68 da 56 00 00       	push   $0x56da
    34a8:	50                   	push   %eax
    34a9:	e8 9a 08 00 00       	call   3d48 <printf>
    34ae:	83 c4 10             	add    $0x10,%esp
    fd = open("bigarg-ok", O_CREATE);
    34b1:	83 ec 08             	sub    $0x8,%esp
    34b4:	68 00 02 00 00       	push   $0x200
    34b9:	68 e3 55 00 00       	push   $0x55e3
    34be:	e8 43 07 00 00       	call   3c06 <open>
    34c3:	83 c4 10             	add    $0x10,%esp
    34c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    34c9:	83 ec 0c             	sub    $0xc,%esp
    34cc:	ff 75 ec             	pushl  -0x14(%ebp)
    34cf:	e8 1a 07 00 00       	call   3bee <close>
    34d4:	83 c4 10             	add    $0x10,%esp
    exit();
    34d7:	e8 ea 06 00 00       	call   3bc6 <exit>
  } else if(pid < 0){
    34dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34e0:	79 1b                	jns    34fd <bigargtest+0xdf>
    printf(stdout, "bigargtest: fork failed\n");
    34e2:	a1 48 5e 00 00       	mov    0x5e48,%eax
    34e7:	83 ec 08             	sub    $0x8,%esp
    34ea:	68 ea 56 00 00       	push   $0x56ea
    34ef:	50                   	push   %eax
    34f0:	e8 53 08 00 00       	call   3d48 <printf>
    34f5:	83 c4 10             	add    $0x10,%esp
    exit();
    34f8:	e8 c9 06 00 00       	call   3bc6 <exit>
  }
  wait();
    34fd:	e8 cc 06 00 00       	call   3bce <wait>
  fd = open("bigarg-ok", 0);
    3502:	83 ec 08             	sub    $0x8,%esp
    3505:	6a 00                	push   $0x0
    3507:	68 e3 55 00 00       	push   $0x55e3
    350c:	e8 f5 06 00 00       	call   3c06 <open>
    3511:	83 c4 10             	add    $0x10,%esp
    3514:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    3517:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    351b:	79 1b                	jns    3538 <bigargtest+0x11a>
    printf(stdout, "bigarg test failed!\n");
    351d:	a1 48 5e 00 00       	mov    0x5e48,%eax
    3522:	83 ec 08             	sub    $0x8,%esp
    3525:	68 03 57 00 00       	push   $0x5703
    352a:	50                   	push   %eax
    352b:	e8 18 08 00 00       	call   3d48 <printf>
    3530:	83 c4 10             	add    $0x10,%esp
    exit();
    3533:	e8 8e 06 00 00       	call   3bc6 <exit>
  }
  close(fd);
    3538:	83 ec 0c             	sub    $0xc,%esp
    353b:	ff 75 ec             	pushl  -0x14(%ebp)
    353e:	e8 ab 06 00 00       	call   3bee <close>
    3543:	83 c4 10             	add    $0x10,%esp
  unlink("bigarg-ok");
    3546:	83 ec 0c             	sub    $0xc,%esp
    3549:	68 e3 55 00 00       	push   $0x55e3
    354e:	e8 c3 06 00 00       	call   3c16 <unlink>
    3553:	83 c4 10             	add    $0x10,%esp
}
    3556:	c9                   	leave  
    3557:	c3                   	ret    

00003558 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3558:	55                   	push   %ebp
    3559:	89 e5                	mov    %esp,%ebp
    355b:	53                   	push   %ebx
    355c:	83 ec 64             	sub    $0x64,%esp
  int nfiles;
  int fsblocks = 0;
    355f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    3566:	83 ec 08             	sub    $0x8,%esp
    3569:	68 18 57 00 00       	push   $0x5718
    356e:	6a 01                	push   $0x1
    3570:	e8 d3 07 00 00       	call   3d48 <printf>
    3575:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    3578:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    357f:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3583:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3586:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    358b:	f7 e9                	imul   %ecx
    358d:	c1 fa 06             	sar    $0x6,%edx
    3590:	89 c8                	mov    %ecx,%eax
    3592:	c1 f8 1f             	sar    $0x1f,%eax
    3595:	29 c2                	sub    %eax,%edx
    3597:	89 d0                	mov    %edx,%eax
    3599:	83 c0 30             	add    $0x30,%eax
    359c:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    359f:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    35a2:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    35a7:	f7 eb                	imul   %ebx
    35a9:	c1 fa 06             	sar    $0x6,%edx
    35ac:	89 d8                	mov    %ebx,%eax
    35ae:	c1 f8 1f             	sar    $0x1f,%eax
    35b1:	89 d1                	mov    %edx,%ecx
    35b3:	29 c1                	sub    %eax,%ecx
    35b5:	89 c8                	mov    %ecx,%eax
    35b7:	c1 e0 02             	shl    $0x2,%eax
    35ba:	01 c8                	add    %ecx,%eax
    35bc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    35c3:	01 d0                	add    %edx,%eax
    35c5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    35cc:	01 d0                	add    %edx,%eax
    35ce:	c1 e0 03             	shl    $0x3,%eax
    35d1:	29 c3                	sub    %eax,%ebx
    35d3:	89 d9                	mov    %ebx,%ecx
    35d5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    35da:	f7 e9                	imul   %ecx
    35dc:	c1 fa 05             	sar    $0x5,%edx
    35df:	89 c8                	mov    %ecx,%eax
    35e1:	c1 f8 1f             	sar    $0x1f,%eax
    35e4:	29 c2                	sub    %eax,%edx
    35e6:	89 d0                	mov    %edx,%eax
    35e8:	83 c0 30             	add    $0x30,%eax
    35eb:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    35ee:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    35f1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    35f6:	f7 eb                	imul   %ebx
    35f8:	c1 fa 05             	sar    $0x5,%edx
    35fb:	89 d8                	mov    %ebx,%eax
    35fd:	c1 f8 1f             	sar    $0x1f,%eax
    3600:	89 d1                	mov    %edx,%ecx
    3602:	29 c1                	sub    %eax,%ecx
    3604:	89 c8                	mov    %ecx,%eax
    3606:	c1 e0 02             	shl    $0x2,%eax
    3609:	01 c8                	add    %ecx,%eax
    360b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3612:	01 d0                	add    %edx,%eax
    3614:	c1 e0 02             	shl    $0x2,%eax
    3617:	29 c3                	sub    %eax,%ebx
    3619:	89 d9                	mov    %ebx,%ecx
    361b:	b8 67 66 66 66       	mov    $0x66666667,%eax
    3620:	f7 e9                	imul   %ecx
    3622:	c1 fa 02             	sar    $0x2,%edx
    3625:	89 c8                	mov    %ecx,%eax
    3627:	c1 f8 1f             	sar    $0x1f,%eax
    362a:	29 c2                	sub    %eax,%edx
    362c:	89 d0                	mov    %edx,%eax
    362e:	83 c0 30             	add    $0x30,%eax
    3631:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3634:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3637:	b8 67 66 66 66       	mov    $0x66666667,%eax
    363c:	f7 e9                	imul   %ecx
    363e:	c1 fa 02             	sar    $0x2,%edx
    3641:	89 c8                	mov    %ecx,%eax
    3643:	c1 f8 1f             	sar    $0x1f,%eax
    3646:	29 c2                	sub    %eax,%edx
    3648:	89 d0                	mov    %edx,%eax
    364a:	c1 e0 02             	shl    $0x2,%eax
    364d:	01 d0                	add    %edx,%eax
    364f:	01 c0                	add    %eax,%eax
    3651:	29 c1                	sub    %eax,%ecx
    3653:	89 ca                	mov    %ecx,%edx
    3655:	88 d0                	mov    %dl,%al
    3657:	83 c0 30             	add    $0x30,%eax
    365a:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    365d:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3661:	83 ec 04             	sub    $0x4,%esp
    3664:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3667:	50                   	push   %eax
    3668:	68 25 57 00 00       	push   $0x5725
    366d:	6a 01                	push   $0x1
    366f:	e8 d4 06 00 00       	call   3d48 <printf>
    3674:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    3677:	83 ec 08             	sub    $0x8,%esp
    367a:	68 02 02 00 00       	push   $0x202
    367f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3682:	50                   	push   %eax
    3683:	e8 7e 05 00 00       	call   3c06 <open>
    3688:	83 c4 10             	add    $0x10,%esp
    368b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    368e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3692:	79 18                	jns    36ac <fsfull+0x154>
      printf(1, "open %s failed\n", name);
    3694:	83 ec 04             	sub    $0x4,%esp
    3697:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    369a:	50                   	push   %eax
    369b:	68 31 57 00 00       	push   $0x5731
    36a0:	6a 01                	push   $0x1
    36a2:	e8 a1 06 00 00       	call   3d48 <printf>
    36a7:	83 c4 10             	add    $0x10,%esp
      break;
    36aa:	eb 6c                	jmp    3718 <fsfull+0x1c0>
    }
    int total = 0;
    36ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    36b3:	83 ec 04             	sub    $0x4,%esp
    36b6:	68 00 02 00 00       	push   $0x200
    36bb:	68 40 86 00 00       	push   $0x8640
    36c0:	ff 75 e8             	pushl  -0x18(%ebp)
    36c3:	e8 1e 05 00 00       	call   3be6 <write>
    36c8:	83 c4 10             	add    $0x10,%esp
    36cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    36ce:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    36d5:	7f 2c                	jg     3703 <fsfull+0x1ab>
        break;
    36d7:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    36d8:	83 ec 04             	sub    $0x4,%esp
    36db:	ff 75 ec             	pushl  -0x14(%ebp)
    36de:	68 41 57 00 00       	push   $0x5741
    36e3:	6a 01                	push   $0x1
    36e5:	e8 5e 06 00 00       	call   3d48 <printf>
    36ea:	83 c4 10             	add    $0x10,%esp
    close(fd);
    36ed:	83 ec 0c             	sub    $0xc,%esp
    36f0:	ff 75 e8             	pushl  -0x18(%ebp)
    36f3:	e8 f6 04 00 00       	call   3bee <close>
    36f8:	83 c4 10             	add    $0x10,%esp
    if(total == 0)
    36fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    36ff:	75 0f                	jne    3710 <fsfull+0x1b8>
    3701:	eb 0b                	jmp    370e <fsfull+0x1b6>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3706:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3709:	ff 45 f0             	incl   -0x10(%ebp)
    }
    370c:	eb a5                	jmp    36b3 <fsfull+0x15b>
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    370e:	eb 08                	jmp    3718 <fsfull+0x1c0>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3710:	ff 45 f4             	incl   -0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3713:	e9 67 fe ff ff       	jmp    357f <fsfull+0x27>

  while(nfiles >= 0){
    3718:	e9 f4 00 00 00       	jmp    3811 <fsfull+0x2b9>
    char name[64];
    name[0] = 'f';
    371d:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3721:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3724:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3729:	f7 e9                	imul   %ecx
    372b:	c1 fa 06             	sar    $0x6,%edx
    372e:	89 c8                	mov    %ecx,%eax
    3730:	c1 f8 1f             	sar    $0x1f,%eax
    3733:	29 c2                	sub    %eax,%edx
    3735:	89 d0                	mov    %edx,%eax
    3737:	83 c0 30             	add    $0x30,%eax
    373a:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    373d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3740:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3745:	f7 eb                	imul   %ebx
    3747:	c1 fa 06             	sar    $0x6,%edx
    374a:	89 d8                	mov    %ebx,%eax
    374c:	c1 f8 1f             	sar    $0x1f,%eax
    374f:	89 d1                	mov    %edx,%ecx
    3751:	29 c1                	sub    %eax,%ecx
    3753:	89 c8                	mov    %ecx,%eax
    3755:	c1 e0 02             	shl    $0x2,%eax
    3758:	01 c8                	add    %ecx,%eax
    375a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3761:	01 d0                	add    %edx,%eax
    3763:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    376a:	01 d0                	add    %edx,%eax
    376c:	c1 e0 03             	shl    $0x3,%eax
    376f:	29 c3                	sub    %eax,%ebx
    3771:	89 d9                	mov    %ebx,%ecx
    3773:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3778:	f7 e9                	imul   %ecx
    377a:	c1 fa 05             	sar    $0x5,%edx
    377d:	89 c8                	mov    %ecx,%eax
    377f:	c1 f8 1f             	sar    $0x1f,%eax
    3782:	29 c2                	sub    %eax,%edx
    3784:	89 d0                	mov    %edx,%eax
    3786:	83 c0 30             	add    $0x30,%eax
    3789:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    378c:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    378f:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3794:	f7 eb                	imul   %ebx
    3796:	c1 fa 05             	sar    $0x5,%edx
    3799:	89 d8                	mov    %ebx,%eax
    379b:	c1 f8 1f             	sar    $0x1f,%eax
    379e:	89 d1                	mov    %edx,%ecx
    37a0:	29 c1                	sub    %eax,%ecx
    37a2:	89 c8                	mov    %ecx,%eax
    37a4:	c1 e0 02             	shl    $0x2,%eax
    37a7:	01 c8                	add    %ecx,%eax
    37a9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    37b0:	01 d0                	add    %edx,%eax
    37b2:	c1 e0 02             	shl    $0x2,%eax
    37b5:	29 c3                	sub    %eax,%ebx
    37b7:	89 d9                	mov    %ebx,%ecx
    37b9:	b8 67 66 66 66       	mov    $0x66666667,%eax
    37be:	f7 e9                	imul   %ecx
    37c0:	c1 fa 02             	sar    $0x2,%edx
    37c3:	89 c8                	mov    %ecx,%eax
    37c5:	c1 f8 1f             	sar    $0x1f,%eax
    37c8:	29 c2                	sub    %eax,%edx
    37ca:	89 d0                	mov    %edx,%eax
    37cc:	83 c0 30             	add    $0x30,%eax
    37cf:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    37d2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    37d5:	b8 67 66 66 66       	mov    $0x66666667,%eax
    37da:	f7 e9                	imul   %ecx
    37dc:	c1 fa 02             	sar    $0x2,%edx
    37df:	89 c8                	mov    %ecx,%eax
    37e1:	c1 f8 1f             	sar    $0x1f,%eax
    37e4:	29 c2                	sub    %eax,%edx
    37e6:	89 d0                	mov    %edx,%eax
    37e8:	c1 e0 02             	shl    $0x2,%eax
    37eb:	01 d0                	add    %edx,%eax
    37ed:	01 c0                	add    %eax,%eax
    37ef:	29 c1                	sub    %eax,%ecx
    37f1:	89 ca                	mov    %ecx,%edx
    37f3:	88 d0                	mov    %dl,%al
    37f5:	83 c0 30             	add    $0x30,%eax
    37f8:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    37fb:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    37ff:	83 ec 0c             	sub    $0xc,%esp
    3802:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3805:	50                   	push   %eax
    3806:	e8 0b 04 00 00       	call   3c16 <unlink>
    380b:	83 c4 10             	add    $0x10,%esp
    nfiles--;
    380e:	ff 4d f4             	decl   -0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3811:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3815:	0f 89 02 ff ff ff    	jns    371d <fsfull+0x1c5>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    381b:	83 ec 08             	sub    $0x8,%esp
    381e:	68 51 57 00 00       	push   $0x5751
    3823:	6a 01                	push   $0x1
    3825:	e8 1e 05 00 00       	call   3d48 <printf>
    382a:	83 c4 10             	add    $0x10,%esp
}
    382d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3830:	c9                   	leave  
    3831:	c3                   	ret    

00003832 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3832:	55                   	push   %ebp
    3833:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3835:	8b 15 4c 5e 00 00    	mov    0x5e4c,%edx
    383b:	89 d0                	mov    %edx,%eax
    383d:	01 c0                	add    %eax,%eax
    383f:	01 d0                	add    %edx,%eax
    3841:	c1 e0 02             	shl    $0x2,%eax
    3844:	01 d0                	add    %edx,%eax
    3846:	c1 e0 08             	shl    $0x8,%eax
    3849:	01 d0                	add    %edx,%eax
    384b:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
    3852:	01 c8                	add    %ecx,%eax
    3854:	c1 e0 02             	shl    $0x2,%eax
    3857:	01 d0                	add    %edx,%eax
    3859:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3860:	01 d0                	add    %edx,%eax
    3862:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3869:	01 d0                	add    %edx,%eax
    386b:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3870:	a3 4c 5e 00 00       	mov    %eax,0x5e4c
  return randstate;
    3875:	a1 4c 5e 00 00       	mov    0x5e4c,%eax
}
    387a:	5d                   	pop    %ebp
    387b:	c3                   	ret    

0000387c <main>:

int
main(int argc, char *argv[])
{
    387c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3880:	83 e4 f0             	and    $0xfffffff0,%esp
    3883:	ff 71 fc             	pushl  -0x4(%ecx)
    3886:	55                   	push   %ebp
    3887:	89 e5                	mov    %esp,%ebp
    3889:	51                   	push   %ecx
    388a:	83 ec 04             	sub    $0x4,%esp
  printf(1, "usertests starting\n");
    388d:	83 ec 08             	sub    $0x8,%esp
    3890:	68 67 57 00 00       	push   $0x5767
    3895:	6a 01                	push   $0x1
    3897:	e8 ac 04 00 00       	call   3d48 <printf>
    389c:	83 c4 10             	add    $0x10,%esp

  if(open("usertests.ran", 0) >= 0){
    389f:	83 ec 08             	sub    $0x8,%esp
    38a2:	6a 00                	push   $0x0
    38a4:	68 7b 57 00 00       	push   $0x577b
    38a9:	e8 58 03 00 00       	call   3c06 <open>
    38ae:	83 c4 10             	add    $0x10,%esp
    38b1:	85 c0                	test   %eax,%eax
    38b3:	78 17                	js     38cc <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    38b5:	83 ec 08             	sub    $0x8,%esp
    38b8:	68 8c 57 00 00       	push   $0x578c
    38bd:	6a 01                	push   $0x1
    38bf:	e8 84 04 00 00       	call   3d48 <printf>
    38c4:	83 c4 10             	add    $0x10,%esp
    exit();
    38c7:	e8 fa 02 00 00       	call   3bc6 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    38cc:	83 ec 08             	sub    $0x8,%esp
    38cf:	68 00 02 00 00       	push   $0x200
    38d4:	68 7b 57 00 00       	push   $0x577b
    38d9:	e8 28 03 00 00       	call   3c06 <open>
    38de:	83 c4 10             	add    $0x10,%esp
    38e1:	83 ec 0c             	sub    $0xc,%esp
    38e4:	50                   	push   %eax
    38e5:	e8 04 03 00 00       	call   3bee <close>
    38ea:	83 c4 10             	add    $0x10,%esp

  bigargtest();
    38ed:	e8 2c fb ff ff       	call   341e <bigargtest>
  bigwrite();
    38f2:	e8 ab ea ff ff       	call   23a2 <bigwrite>
  bigargtest();
    38f7:	e8 22 fb ff ff       	call   341e <bigargtest>
  bsstest();
    38fc:	e8 aa fa ff ff       	call   33ab <bsstest>
  sbrktest();
    3901:	e8 c5 f4 ff ff       	call   2dcb <sbrktest>
  validatetest();
    3906:	e8 c3 f9 ff ff       	call   32ce <validatetest>

  opentest();
    390b:	e8 f0 c6 ff ff       	call   0 <opentest>
  writetest();
    3910:	e8 99 c7 ff ff       	call   ae <writetest>
  writetest1();
    3915:	e8 a2 c9 ff ff       	call   2bc <writetest1>
  createtest();
    391a:	e8 98 cb ff ff       	call   4b7 <createtest>

  mem();
    391f:	e8 58 d1 ff ff       	call   a7c <mem>
  pipe1();
    3924:	e8 90 cd ff ff       	call   6b9 <pipe1>
  preempt();
    3929:	e8 74 cf ff ff       	call   8a2 <preempt>
  exitwait();
    392e:	e8 d2 d0 ff ff       	call   a05 <exitwait>

  rmdot();
    3933:	e8 d8 ee ff ff       	call   2810 <rmdot>
  fourteen();
    3938:	e8 78 ed ff ff       	call   26b5 <fourteen>
  bigfile();
    393d:	e8 5c eb ff ff       	call   249e <bigfile>
  subdir();
    3942:	e8 1a e3 ff ff       	call   1c61 <subdir>
  concreate();
    3947:	e8 f3 dc ff ff       	call   163f <concreate>
  linkunlink();
    394c:	e8 4d e0 ff ff       	call   199e <linkunlink>
  linktest();
    3951:	e8 a8 da ff ff       	call   13fe <linktest>
  unlinkread();
    3956:	e8 e4 d8 ff ff       	call   123f <unlinkread>
  createdelete();
    395b:	e8 43 d6 ff ff       	call   fa3 <createdelete>
  twofiles();
    3960:	e8 e4 d3 ff ff       	call   d49 <twofiles>
  sharedfd();
    3965:	e8 02 d2 ff ff       	call   b6c <sharedfd>
  dirfile();
    396a:	e8 25 f0 ff ff       	call   2994 <dirfile>
  iref();
    396f:	e8 57 f2 ff ff       	call   2bcb <iref>
  forktest();
    3974:	e8 8a f3 ff ff       	call   2d03 <forktest>
  bigdir(); // slow
    3979:	e8 6d e1 ff ff       	call   1aeb <bigdir>

  exectest();
    397e:	e8 e4 cc ff ff       	call   667 <exectest>

  exit();
    3983:	e8 3e 02 00 00       	call   3bc6 <exit>

00003988 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3988:	55                   	push   %ebp
    3989:	89 e5                	mov    %esp,%ebp
    398b:	57                   	push   %edi
    398c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    398d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3990:	8b 55 10             	mov    0x10(%ebp),%edx
    3993:	8b 45 0c             	mov    0xc(%ebp),%eax
    3996:	89 cb                	mov    %ecx,%ebx
    3998:	89 df                	mov    %ebx,%edi
    399a:	89 d1                	mov    %edx,%ecx
    399c:	fc                   	cld    
    399d:	f3 aa                	rep stos %al,%es:(%edi)
    399f:	89 ca                	mov    %ecx,%edx
    39a1:	89 fb                	mov    %edi,%ebx
    39a3:	89 5d 08             	mov    %ebx,0x8(%ebp)
    39a6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    39a9:	5b                   	pop    %ebx
    39aa:	5f                   	pop    %edi
    39ab:	5d                   	pop    %ebp
    39ac:	c3                   	ret    

000039ad <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    39ad:	55                   	push   %ebp
    39ae:	89 e5                	mov    %esp,%ebp
    39b0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    39b3:	8b 45 08             	mov    0x8(%ebp),%eax
    39b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    39b9:	90                   	nop
    39ba:	8b 45 08             	mov    0x8(%ebp),%eax
    39bd:	8d 50 01             	lea    0x1(%eax),%edx
    39c0:	89 55 08             	mov    %edx,0x8(%ebp)
    39c3:	8b 55 0c             	mov    0xc(%ebp),%edx
    39c6:	8d 4a 01             	lea    0x1(%edx),%ecx
    39c9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    39cc:	8a 12                	mov    (%edx),%dl
    39ce:	88 10                	mov    %dl,(%eax)
    39d0:	8a 00                	mov    (%eax),%al
    39d2:	84 c0                	test   %al,%al
    39d4:	75 e4                	jne    39ba <strcpy+0xd>
    ;
  return os;
    39d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    39d9:	c9                   	leave  
    39da:	c3                   	ret    

000039db <strcmp>:

int
strcmp(const char *p, const char *q)
{
    39db:	55                   	push   %ebp
    39dc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    39de:	eb 06                	jmp    39e6 <strcmp+0xb>
    p++, q++;
    39e0:	ff 45 08             	incl   0x8(%ebp)
    39e3:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    39e6:	8b 45 08             	mov    0x8(%ebp),%eax
    39e9:	8a 00                	mov    (%eax),%al
    39eb:	84 c0                	test   %al,%al
    39ed:	74 0e                	je     39fd <strcmp+0x22>
    39ef:	8b 45 08             	mov    0x8(%ebp),%eax
    39f2:	8a 10                	mov    (%eax),%dl
    39f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    39f7:	8a 00                	mov    (%eax),%al
    39f9:	38 c2                	cmp    %al,%dl
    39fb:	74 e3                	je     39e0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    39fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3a00:	8a 00                	mov    (%eax),%al
    3a02:	0f b6 d0             	movzbl %al,%edx
    3a05:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a08:	8a 00                	mov    (%eax),%al
    3a0a:	0f b6 c0             	movzbl %al,%eax
    3a0d:	29 c2                	sub    %eax,%edx
    3a0f:	89 d0                	mov    %edx,%eax
}
    3a11:	5d                   	pop    %ebp
    3a12:	c3                   	ret    

00003a13 <strlen>:

uint
strlen(char *s)
{
    3a13:	55                   	push   %ebp
    3a14:	89 e5                	mov    %esp,%ebp
    3a16:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a20:	eb 03                	jmp    3a25 <strlen+0x12>
    3a22:	ff 45 fc             	incl   -0x4(%ebp)
    3a25:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a28:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2b:	01 d0                	add    %edx,%eax
    3a2d:	8a 00                	mov    (%eax),%al
    3a2f:	84 c0                	test   %al,%al
    3a31:	75 ef                	jne    3a22 <strlen+0xf>
    ;
  return n;
    3a33:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a36:	c9                   	leave  
    3a37:	c3                   	ret    

00003a38 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3a38:	55                   	push   %ebp
    3a39:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3a3b:	8b 45 10             	mov    0x10(%ebp),%eax
    3a3e:	50                   	push   %eax
    3a3f:	ff 75 0c             	pushl  0xc(%ebp)
    3a42:	ff 75 08             	pushl  0x8(%ebp)
    3a45:	e8 3e ff ff ff       	call   3988 <stosb>
    3a4a:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3a4d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3a50:	c9                   	leave  
    3a51:	c3                   	ret    

00003a52 <strchr>:

char*
strchr(const char *s, char c)
{
    3a52:	55                   	push   %ebp
    3a53:	89 e5                	mov    %esp,%ebp
    3a55:	83 ec 04             	sub    $0x4,%esp
    3a58:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a5b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3a5e:	eb 12                	jmp    3a72 <strchr+0x20>
    if(*s == c)
    3a60:	8b 45 08             	mov    0x8(%ebp),%eax
    3a63:	8a 00                	mov    (%eax),%al
    3a65:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3a68:	75 05                	jne    3a6f <strchr+0x1d>
      return (char*)s;
    3a6a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a6d:	eb 11                	jmp    3a80 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3a6f:	ff 45 08             	incl   0x8(%ebp)
    3a72:	8b 45 08             	mov    0x8(%ebp),%eax
    3a75:	8a 00                	mov    (%eax),%al
    3a77:	84 c0                	test   %al,%al
    3a79:	75 e5                	jne    3a60 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3a7b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3a80:	c9                   	leave  
    3a81:	c3                   	ret    

00003a82 <gets>:

char*
gets(char *buf, int max)
{
    3a82:	55                   	push   %ebp
    3a83:	89 e5                	mov    %esp,%ebp
    3a85:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3a88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3a8f:	eb 41                	jmp    3ad2 <gets+0x50>
    cc = read(0, &c, 1);
    3a91:	83 ec 04             	sub    $0x4,%esp
    3a94:	6a 01                	push   $0x1
    3a96:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3a99:	50                   	push   %eax
    3a9a:	6a 00                	push   $0x0
    3a9c:	e8 3d 01 00 00       	call   3bde <read>
    3aa1:	83 c4 10             	add    $0x10,%esp
    3aa4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3aa7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3aab:	7f 02                	jg     3aaf <gets+0x2d>
      break;
    3aad:	eb 2c                	jmp    3adb <gets+0x59>
    buf[i++] = c;
    3aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ab2:	8d 50 01             	lea    0x1(%eax),%edx
    3ab5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3ab8:	89 c2                	mov    %eax,%edx
    3aba:	8b 45 08             	mov    0x8(%ebp),%eax
    3abd:	01 c2                	add    %eax,%edx
    3abf:	8a 45 ef             	mov    -0x11(%ebp),%al
    3ac2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3ac4:	8a 45 ef             	mov    -0x11(%ebp),%al
    3ac7:	3c 0a                	cmp    $0xa,%al
    3ac9:	74 10                	je     3adb <gets+0x59>
    3acb:	8a 45 ef             	mov    -0x11(%ebp),%al
    3ace:	3c 0d                	cmp    $0xd,%al
    3ad0:	74 09                	je     3adb <gets+0x59>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ad5:	40                   	inc    %eax
    3ad6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3ad9:	7c b6                	jl     3a91 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3adb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ade:	8b 45 08             	mov    0x8(%ebp),%eax
    3ae1:	01 d0                	add    %edx,%eax
    3ae3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3ae6:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3ae9:	c9                   	leave  
    3aea:	c3                   	ret    

00003aeb <stat>:

int
stat(char *n, struct stat *st)
{
    3aeb:	55                   	push   %ebp
    3aec:	89 e5                	mov    %esp,%ebp
    3aee:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3af1:	83 ec 08             	sub    $0x8,%esp
    3af4:	6a 00                	push   $0x0
    3af6:	ff 75 08             	pushl  0x8(%ebp)
    3af9:	e8 08 01 00 00       	call   3c06 <open>
    3afe:	83 c4 10             	add    $0x10,%esp
    3b01:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b08:	79 07                	jns    3b11 <stat+0x26>
    return -1;
    3b0a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b0f:	eb 25                	jmp    3b36 <stat+0x4b>
  r = fstat(fd, st);
    3b11:	83 ec 08             	sub    $0x8,%esp
    3b14:	ff 75 0c             	pushl  0xc(%ebp)
    3b17:	ff 75 f4             	pushl  -0xc(%ebp)
    3b1a:	e8 ff 00 00 00       	call   3c1e <fstat>
    3b1f:	83 c4 10             	add    $0x10,%esp
    3b22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3b25:	83 ec 0c             	sub    $0xc,%esp
    3b28:	ff 75 f4             	pushl  -0xc(%ebp)
    3b2b:	e8 be 00 00 00       	call   3bee <close>
    3b30:	83 c4 10             	add    $0x10,%esp
  return r;
    3b33:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3b36:	c9                   	leave  
    3b37:	c3                   	ret    

00003b38 <atoi>:

int
atoi(const char *s)
{
    3b38:	55                   	push   %ebp
    3b39:	89 e5                	mov    %esp,%ebp
    3b3b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3b3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3b45:	eb 24                	jmp    3b6b <atoi+0x33>
    n = n*10 + *s++ - '0';
    3b47:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b4a:	89 d0                	mov    %edx,%eax
    3b4c:	c1 e0 02             	shl    $0x2,%eax
    3b4f:	01 d0                	add    %edx,%eax
    3b51:	01 c0                	add    %eax,%eax
    3b53:	89 c1                	mov    %eax,%ecx
    3b55:	8b 45 08             	mov    0x8(%ebp),%eax
    3b58:	8d 50 01             	lea    0x1(%eax),%edx
    3b5b:	89 55 08             	mov    %edx,0x8(%ebp)
    3b5e:	8a 00                	mov    (%eax),%al
    3b60:	0f be c0             	movsbl %al,%eax
    3b63:	01 c8                	add    %ecx,%eax
    3b65:	83 e8 30             	sub    $0x30,%eax
    3b68:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3b6b:	8b 45 08             	mov    0x8(%ebp),%eax
    3b6e:	8a 00                	mov    (%eax),%al
    3b70:	3c 2f                	cmp    $0x2f,%al
    3b72:	7e 09                	jle    3b7d <atoi+0x45>
    3b74:	8b 45 08             	mov    0x8(%ebp),%eax
    3b77:	8a 00                	mov    (%eax),%al
    3b79:	3c 39                	cmp    $0x39,%al
    3b7b:	7e ca                	jle    3b47 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3b7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3b80:	c9                   	leave  
    3b81:	c3                   	ret    

00003b82 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3b82:	55                   	push   %ebp
    3b83:	89 e5                	mov    %esp,%ebp
    3b85:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3b88:	8b 45 08             	mov    0x8(%ebp),%eax
    3b8b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b91:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3b94:	eb 16                	jmp    3bac <memmove+0x2a>
    *dst++ = *src++;
    3b96:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3b99:	8d 50 01             	lea    0x1(%eax),%edx
    3b9c:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3b9f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3ba2:	8d 4a 01             	lea    0x1(%edx),%ecx
    3ba5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3ba8:	8a 12                	mov    (%edx),%dl
    3baa:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3bac:	8b 45 10             	mov    0x10(%ebp),%eax
    3baf:	8d 50 ff             	lea    -0x1(%eax),%edx
    3bb2:	89 55 10             	mov    %edx,0x10(%ebp)
    3bb5:	85 c0                	test   %eax,%eax
    3bb7:	7f dd                	jg     3b96 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3bb9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3bbc:	c9                   	leave  
    3bbd:	c3                   	ret    

00003bbe <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3bbe:	b8 01 00 00 00       	mov    $0x1,%eax
    3bc3:	cd 40                	int    $0x40
    3bc5:	c3                   	ret    

00003bc6 <exit>:
SYSCALL(exit)
    3bc6:	b8 02 00 00 00       	mov    $0x2,%eax
    3bcb:	cd 40                	int    $0x40
    3bcd:	c3                   	ret    

00003bce <wait>:
SYSCALL(wait)
    3bce:	b8 03 00 00 00       	mov    $0x3,%eax
    3bd3:	cd 40                	int    $0x40
    3bd5:	c3                   	ret    

00003bd6 <pipe>:
SYSCALL(pipe)
    3bd6:	b8 04 00 00 00       	mov    $0x4,%eax
    3bdb:	cd 40                	int    $0x40
    3bdd:	c3                   	ret    

00003bde <read>:
SYSCALL(read)
    3bde:	b8 05 00 00 00       	mov    $0x5,%eax
    3be3:	cd 40                	int    $0x40
    3be5:	c3                   	ret    

00003be6 <write>:
SYSCALL(write)
    3be6:	b8 10 00 00 00       	mov    $0x10,%eax
    3beb:	cd 40                	int    $0x40
    3bed:	c3                   	ret    

00003bee <close>:
SYSCALL(close)
    3bee:	b8 15 00 00 00       	mov    $0x15,%eax
    3bf3:	cd 40                	int    $0x40
    3bf5:	c3                   	ret    

00003bf6 <kill>:
SYSCALL(kill)
    3bf6:	b8 06 00 00 00       	mov    $0x6,%eax
    3bfb:	cd 40                	int    $0x40
    3bfd:	c3                   	ret    

00003bfe <exec>:
SYSCALL(exec)
    3bfe:	b8 07 00 00 00       	mov    $0x7,%eax
    3c03:	cd 40                	int    $0x40
    3c05:	c3                   	ret    

00003c06 <open>:
SYSCALL(open)
    3c06:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c0b:	cd 40                	int    $0x40
    3c0d:	c3                   	ret    

00003c0e <mknod>:
SYSCALL(mknod)
    3c0e:	b8 11 00 00 00       	mov    $0x11,%eax
    3c13:	cd 40                	int    $0x40
    3c15:	c3                   	ret    

00003c16 <unlink>:
SYSCALL(unlink)
    3c16:	b8 12 00 00 00       	mov    $0x12,%eax
    3c1b:	cd 40                	int    $0x40
    3c1d:	c3                   	ret    

00003c1e <fstat>:
SYSCALL(fstat)
    3c1e:	b8 08 00 00 00       	mov    $0x8,%eax
    3c23:	cd 40                	int    $0x40
    3c25:	c3                   	ret    

00003c26 <link>:
SYSCALL(link)
    3c26:	b8 13 00 00 00       	mov    $0x13,%eax
    3c2b:	cd 40                	int    $0x40
    3c2d:	c3                   	ret    

00003c2e <mkdir>:
SYSCALL(mkdir)
    3c2e:	b8 14 00 00 00       	mov    $0x14,%eax
    3c33:	cd 40                	int    $0x40
    3c35:	c3                   	ret    

00003c36 <chdir>:
SYSCALL(chdir)
    3c36:	b8 09 00 00 00       	mov    $0x9,%eax
    3c3b:	cd 40                	int    $0x40
    3c3d:	c3                   	ret    

00003c3e <dup>:
SYSCALL(dup)
    3c3e:	b8 0a 00 00 00       	mov    $0xa,%eax
    3c43:	cd 40                	int    $0x40
    3c45:	c3                   	ret    

00003c46 <getpid>:
SYSCALL(getpid)
    3c46:	b8 0b 00 00 00       	mov    $0xb,%eax
    3c4b:	cd 40                	int    $0x40
    3c4d:	c3                   	ret    

00003c4e <sbrk>:
SYSCALL(sbrk)
    3c4e:	b8 0c 00 00 00       	mov    $0xc,%eax
    3c53:	cd 40                	int    $0x40
    3c55:	c3                   	ret    

00003c56 <sleep>:
SYSCALL(sleep)
    3c56:	b8 0d 00 00 00       	mov    $0xd,%eax
    3c5b:	cd 40                	int    $0x40
    3c5d:	c3                   	ret    

00003c5e <uptime>:
SYSCALL(uptime)
    3c5e:	b8 0e 00 00 00       	mov    $0xe,%eax
    3c63:	cd 40                	int    $0x40
    3c65:	c3                   	ret    

00003c66 <getCallCount>:
SYSCALL(getCallCount)
    3c66:	b8 16 00 00 00       	mov    $0x16,%eax
    3c6b:	cd 40                	int    $0x40
    3c6d:	c3                   	ret    

00003c6e <myMemory>:
SYSCALL(myMemory)
    3c6e:	b8 17 00 00 00       	mov    $0x17,%eax
    3c73:	cd 40                	int    $0x40
    3c75:	c3                   	ret    

00003c76 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3c76:	55                   	push   %ebp
    3c77:	89 e5                	mov    %esp,%ebp
    3c79:	83 ec 18             	sub    $0x18,%esp
    3c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c7f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3c82:	83 ec 04             	sub    $0x4,%esp
    3c85:	6a 01                	push   $0x1
    3c87:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3c8a:	50                   	push   %eax
    3c8b:	ff 75 08             	pushl  0x8(%ebp)
    3c8e:	e8 53 ff ff ff       	call   3be6 <write>
    3c93:	83 c4 10             	add    $0x10,%esp
}
    3c96:	c9                   	leave  
    3c97:	c3                   	ret    

00003c98 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3c98:	55                   	push   %ebp
    3c99:	89 e5                	mov    %esp,%ebp
    3c9b:	53                   	push   %ebx
    3c9c:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3c9f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3ca6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3caa:	74 17                	je     3cc3 <printint+0x2b>
    3cac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3cb0:	79 11                	jns    3cc3 <printint+0x2b>
    neg = 1;
    3cb2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cbc:	f7 d8                	neg    %eax
    3cbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3cc1:	eb 06                	jmp    3cc9 <printint+0x31>
  } else {
    x = xx;
    3cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3cc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3cd0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3cd3:	8d 41 01             	lea    0x1(%ecx),%eax
    3cd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3cd9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3cdc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3cdf:	ba 00 00 00 00       	mov    $0x0,%edx
    3ce4:	f7 f3                	div    %ebx
    3ce6:	89 d0                	mov    %edx,%eax
    3ce8:	8a 80 50 5e 00 00    	mov    0x5e50(%eax),%al
    3cee:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3cf2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3cf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3cf8:	ba 00 00 00 00       	mov    $0x0,%edx
    3cfd:	f7 f3                	div    %ebx
    3cff:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d02:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d06:	75 c8                	jne    3cd0 <printint+0x38>
  if(neg)
    3d08:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3d0c:	74 0e                	je     3d1c <printint+0x84>
    buf[i++] = '-';
    3d0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d11:	8d 50 01             	lea    0x1(%eax),%edx
    3d14:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3d17:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3d1c:	eb 1c                	jmp    3d3a <printint+0xa2>
    putc(fd, buf[i]);
    3d1e:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d24:	01 d0                	add    %edx,%eax
    3d26:	8a 00                	mov    (%eax),%al
    3d28:	0f be c0             	movsbl %al,%eax
    3d2b:	83 ec 08             	sub    $0x8,%esp
    3d2e:	50                   	push   %eax
    3d2f:	ff 75 08             	pushl  0x8(%ebp)
    3d32:	e8 3f ff ff ff       	call   3c76 <putc>
    3d37:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3d3a:	ff 4d f4             	decl   -0xc(%ebp)
    3d3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d41:	79 db                	jns    3d1e <printint+0x86>
    putc(fd, buf[i]);
}
    3d43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3d46:	c9                   	leave  
    3d47:	c3                   	ret    

00003d48 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3d48:	55                   	push   %ebp
    3d49:	89 e5                	mov    %esp,%ebp
    3d4b:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3d4e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3d55:	8d 45 0c             	lea    0xc(%ebp),%eax
    3d58:	83 c0 04             	add    $0x4,%eax
    3d5b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3d5e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3d65:	e9 54 01 00 00       	jmp    3ebe <printf+0x176>
    c = fmt[i] & 0xff;
    3d6a:	8b 55 0c             	mov    0xc(%ebp),%edx
    3d6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3d70:	01 d0                	add    %edx,%eax
    3d72:	8a 00                	mov    (%eax),%al
    3d74:	0f be c0             	movsbl %al,%eax
    3d77:	25 ff 00 00 00       	and    $0xff,%eax
    3d7c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3d7f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d83:	75 2c                	jne    3db1 <printf+0x69>
      if(c == '%'){
    3d85:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3d89:	75 0c                	jne    3d97 <printf+0x4f>
        state = '%';
    3d8b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3d92:	e9 24 01 00 00       	jmp    3ebb <printf+0x173>
      } else {
        putc(fd, c);
    3d97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d9a:	0f be c0             	movsbl %al,%eax
    3d9d:	83 ec 08             	sub    $0x8,%esp
    3da0:	50                   	push   %eax
    3da1:	ff 75 08             	pushl  0x8(%ebp)
    3da4:	e8 cd fe ff ff       	call   3c76 <putc>
    3da9:	83 c4 10             	add    $0x10,%esp
    3dac:	e9 0a 01 00 00       	jmp    3ebb <printf+0x173>
      }
    } else if(state == '%'){
    3db1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3db5:	0f 85 00 01 00 00    	jne    3ebb <printf+0x173>
      if(c == 'd'){
    3dbb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3dbf:	75 1e                	jne    3ddf <printf+0x97>
        printint(fd, *ap, 10, 1);
    3dc1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3dc4:	8b 00                	mov    (%eax),%eax
    3dc6:	6a 01                	push   $0x1
    3dc8:	6a 0a                	push   $0xa
    3dca:	50                   	push   %eax
    3dcb:	ff 75 08             	pushl  0x8(%ebp)
    3dce:	e8 c5 fe ff ff       	call   3c98 <printint>
    3dd3:	83 c4 10             	add    $0x10,%esp
        ap++;
    3dd6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3dda:	e9 d5 00 00 00       	jmp    3eb4 <printf+0x16c>
      } else if(c == 'x' || c == 'p'){
    3ddf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3de3:	74 06                	je     3deb <printf+0xa3>
    3de5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3de9:	75 1e                	jne    3e09 <printf+0xc1>
        printint(fd, *ap, 16, 0);
    3deb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3dee:	8b 00                	mov    (%eax),%eax
    3df0:	6a 00                	push   $0x0
    3df2:	6a 10                	push   $0x10
    3df4:	50                   	push   %eax
    3df5:	ff 75 08             	pushl  0x8(%ebp)
    3df8:	e8 9b fe ff ff       	call   3c98 <printint>
    3dfd:	83 c4 10             	add    $0x10,%esp
        ap++;
    3e00:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e04:	e9 ab 00 00 00       	jmp    3eb4 <printf+0x16c>
      } else if(c == 's'){
    3e09:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3e0d:	75 40                	jne    3e4f <printf+0x107>
        s = (char*)*ap;
    3e0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e12:	8b 00                	mov    (%eax),%eax
    3e14:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3e17:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3e1b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e1f:	75 07                	jne    3e28 <printf+0xe0>
          s = "(null)";
    3e21:	c7 45 f4 b6 57 00 00 	movl   $0x57b6,-0xc(%ebp)
        while(*s != 0){
    3e28:	eb 1a                	jmp    3e44 <printf+0xfc>
          putc(fd, *s);
    3e2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e2d:	8a 00                	mov    (%eax),%al
    3e2f:	0f be c0             	movsbl %al,%eax
    3e32:	83 ec 08             	sub    $0x8,%esp
    3e35:	50                   	push   %eax
    3e36:	ff 75 08             	pushl  0x8(%ebp)
    3e39:	e8 38 fe ff ff       	call   3c76 <putc>
    3e3e:	83 c4 10             	add    $0x10,%esp
          s++;
    3e41:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3e44:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e47:	8a 00                	mov    (%eax),%al
    3e49:	84 c0                	test   %al,%al
    3e4b:	75 dd                	jne    3e2a <printf+0xe2>
    3e4d:	eb 65                	jmp    3eb4 <printf+0x16c>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3e4f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3e53:	75 1d                	jne    3e72 <printf+0x12a>
        putc(fd, *ap);
    3e55:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e58:	8b 00                	mov    (%eax),%eax
    3e5a:	0f be c0             	movsbl %al,%eax
    3e5d:	83 ec 08             	sub    $0x8,%esp
    3e60:	50                   	push   %eax
    3e61:	ff 75 08             	pushl  0x8(%ebp)
    3e64:	e8 0d fe ff ff       	call   3c76 <putc>
    3e69:	83 c4 10             	add    $0x10,%esp
        ap++;
    3e6c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e70:	eb 42                	jmp    3eb4 <printf+0x16c>
      } else if(c == '%'){
    3e72:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3e76:	75 17                	jne    3e8f <printf+0x147>
        putc(fd, c);
    3e78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e7b:	0f be c0             	movsbl %al,%eax
    3e7e:	83 ec 08             	sub    $0x8,%esp
    3e81:	50                   	push   %eax
    3e82:	ff 75 08             	pushl  0x8(%ebp)
    3e85:	e8 ec fd ff ff       	call   3c76 <putc>
    3e8a:	83 c4 10             	add    $0x10,%esp
    3e8d:	eb 25                	jmp    3eb4 <printf+0x16c>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3e8f:	83 ec 08             	sub    $0x8,%esp
    3e92:	6a 25                	push   $0x25
    3e94:	ff 75 08             	pushl  0x8(%ebp)
    3e97:	e8 da fd ff ff       	call   3c76 <putc>
    3e9c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    3e9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ea2:	0f be c0             	movsbl %al,%eax
    3ea5:	83 ec 08             	sub    $0x8,%esp
    3ea8:	50                   	push   %eax
    3ea9:	ff 75 08             	pushl  0x8(%ebp)
    3eac:	e8 c5 fd ff ff       	call   3c76 <putc>
    3eb1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    3eb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ebb:	ff 45 f0             	incl   -0x10(%ebp)
    3ebe:	8b 55 0c             	mov    0xc(%ebp),%edx
    3ec1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ec4:	01 d0                	add    %edx,%eax
    3ec6:	8a 00                	mov    (%eax),%al
    3ec8:	84 c0                	test   %al,%al
    3eca:	0f 85 9a fe ff ff    	jne    3d6a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3ed0:	c9                   	leave  
    3ed1:	c3                   	ret    

00003ed2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3ed2:	55                   	push   %ebp
    3ed3:	89 e5                	mov    %esp,%ebp
    3ed5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3ed8:	8b 45 08             	mov    0x8(%ebp),%eax
    3edb:	83 e8 08             	sub    $0x8,%eax
    3ede:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3ee1:	a1 08 5f 00 00       	mov    0x5f08,%eax
    3ee6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3ee9:	eb 24                	jmp    3f0f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3eeb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3eee:	8b 00                	mov    (%eax),%eax
    3ef0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3ef3:	77 12                	ja     3f07 <free+0x35>
    3ef5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ef8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3efb:	77 24                	ja     3f21 <free+0x4f>
    3efd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f00:	8b 00                	mov    (%eax),%eax
    3f02:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f05:	77 1a                	ja     3f21 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f07:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f0a:	8b 00                	mov    (%eax),%eax
    3f0c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f12:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f15:	76 d4                	jbe    3eeb <free+0x19>
    3f17:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f1a:	8b 00                	mov    (%eax),%eax
    3f1c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f1f:	76 ca                	jbe    3eeb <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3f21:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f24:	8b 40 04             	mov    0x4(%eax),%eax
    3f27:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3f2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f31:	01 c2                	add    %eax,%edx
    3f33:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f36:	8b 00                	mov    (%eax),%eax
    3f38:	39 c2                	cmp    %eax,%edx
    3f3a:	75 24                	jne    3f60 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    3f3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f3f:	8b 50 04             	mov    0x4(%eax),%edx
    3f42:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f45:	8b 00                	mov    (%eax),%eax
    3f47:	8b 40 04             	mov    0x4(%eax),%eax
    3f4a:	01 c2                	add    %eax,%edx
    3f4c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f4f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3f52:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f55:	8b 00                	mov    (%eax),%eax
    3f57:	8b 10                	mov    (%eax),%edx
    3f59:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f5c:	89 10                	mov    %edx,(%eax)
    3f5e:	eb 0a                	jmp    3f6a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    3f60:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f63:	8b 10                	mov    (%eax),%edx
    3f65:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f68:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    3f6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f6d:	8b 40 04             	mov    0x4(%eax),%eax
    3f70:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3f77:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f7a:	01 d0                	add    %edx,%eax
    3f7c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3f7f:	75 20                	jne    3fa1 <free+0xcf>
    p->s.size += bp->s.size;
    3f81:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f84:	8b 50 04             	mov    0x4(%eax),%edx
    3f87:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f8a:	8b 40 04             	mov    0x4(%eax),%eax
    3f8d:	01 c2                	add    %eax,%edx
    3f8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f92:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3f95:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f98:	8b 10                	mov    (%eax),%edx
    3f9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f9d:	89 10                	mov    %edx,(%eax)
    3f9f:	eb 08                	jmp    3fa9 <free+0xd7>
  } else
    p->s.ptr = bp;
    3fa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fa4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3fa7:	89 10                	mov    %edx,(%eax)
  freep = p;
    3fa9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fac:	a3 08 5f 00 00       	mov    %eax,0x5f08
}
    3fb1:	c9                   	leave  
    3fb2:	c3                   	ret    

00003fb3 <morecore>:

static Header*
morecore(uint nu)
{
    3fb3:	55                   	push   %ebp
    3fb4:	89 e5                	mov    %esp,%ebp
    3fb6:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    3fb9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    3fc0:	77 07                	ja     3fc9 <morecore+0x16>
    nu = 4096;
    3fc2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    3fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    3fcc:	c1 e0 03             	shl    $0x3,%eax
    3fcf:	83 ec 0c             	sub    $0xc,%esp
    3fd2:	50                   	push   %eax
    3fd3:	e8 76 fc ff ff       	call   3c4e <sbrk>
    3fd8:	83 c4 10             	add    $0x10,%esp
    3fdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    3fde:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3fe2:	75 07                	jne    3feb <morecore+0x38>
    return 0;
    3fe4:	b8 00 00 00 00       	mov    $0x0,%eax
    3fe9:	eb 26                	jmp    4011 <morecore+0x5e>
  hp = (Header*)p;
    3feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    3ff1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ff4:	8b 55 08             	mov    0x8(%ebp),%edx
    3ff7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    3ffa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ffd:	83 c0 08             	add    $0x8,%eax
    4000:	83 ec 0c             	sub    $0xc,%esp
    4003:	50                   	push   %eax
    4004:	e8 c9 fe ff ff       	call   3ed2 <free>
    4009:	83 c4 10             	add    $0x10,%esp
  return freep;
    400c:	a1 08 5f 00 00       	mov    0x5f08,%eax
}
    4011:	c9                   	leave  
    4012:	c3                   	ret    

00004013 <malloc>:

void*
malloc(uint nbytes)
{
    4013:	55                   	push   %ebp
    4014:	89 e5                	mov    %esp,%ebp
    4016:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4019:	8b 45 08             	mov    0x8(%ebp),%eax
    401c:	83 c0 07             	add    $0x7,%eax
    401f:	c1 e8 03             	shr    $0x3,%eax
    4022:	40                   	inc    %eax
    4023:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4026:	a1 08 5f 00 00       	mov    0x5f08,%eax
    402b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    402e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4032:	75 23                	jne    4057 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
    4034:	c7 45 f0 00 5f 00 00 	movl   $0x5f00,-0x10(%ebp)
    403b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    403e:	a3 08 5f 00 00       	mov    %eax,0x5f08
    4043:	a1 08 5f 00 00       	mov    0x5f08,%eax
    4048:	a3 00 5f 00 00       	mov    %eax,0x5f00
    base.s.size = 0;
    404d:	c7 05 04 5f 00 00 00 	movl   $0x0,0x5f04
    4054:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4057:	8b 45 f0             	mov    -0x10(%ebp),%eax
    405a:	8b 00                	mov    (%eax),%eax
    405c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    405f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4062:	8b 40 04             	mov    0x4(%eax),%eax
    4065:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4068:	72 4d                	jb     40b7 <malloc+0xa4>
      if(p->s.size == nunits)
    406a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    406d:	8b 40 04             	mov    0x4(%eax),%eax
    4070:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4073:	75 0c                	jne    4081 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
    4075:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4078:	8b 10                	mov    (%eax),%edx
    407a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    407d:	89 10                	mov    %edx,(%eax)
    407f:	eb 26                	jmp    40a7 <malloc+0x94>
      else {
        p->s.size -= nunits;
    4081:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4084:	8b 40 04             	mov    0x4(%eax),%eax
    4087:	2b 45 ec             	sub    -0x14(%ebp),%eax
    408a:	89 c2                	mov    %eax,%edx
    408c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    408f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4092:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4095:	8b 40 04             	mov    0x4(%eax),%eax
    4098:	c1 e0 03             	shl    $0x3,%eax
    409b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    409e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    40a4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    40a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40aa:	a3 08 5f 00 00       	mov    %eax,0x5f08
      return (void*)(p + 1);
    40af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40b2:	83 c0 08             	add    $0x8,%eax
    40b5:	eb 3b                	jmp    40f2 <malloc+0xdf>
    }
    if(p == freep)
    40b7:	a1 08 5f 00 00       	mov    0x5f08,%eax
    40bc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    40bf:	75 1e                	jne    40df <malloc+0xcc>
      if((p = morecore(nunits)) == 0)
    40c1:	83 ec 0c             	sub    $0xc,%esp
    40c4:	ff 75 ec             	pushl  -0x14(%ebp)
    40c7:	e8 e7 fe ff ff       	call   3fb3 <morecore>
    40cc:	83 c4 10             	add    $0x10,%esp
    40cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    40d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    40d6:	75 07                	jne    40df <malloc+0xcc>
        return 0;
    40d8:	b8 00 00 00 00       	mov    $0x0,%eax
    40dd:	eb 13                	jmp    40f2 <malloc+0xdf>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    40e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40e8:	8b 00                	mov    (%eax),%eax
    40ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    40ed:	e9 6d ff ff ff       	jmp    405f <malloc+0x4c>
}
    40f2:	c9                   	leave  
    40f3:	c3                   	ret    
