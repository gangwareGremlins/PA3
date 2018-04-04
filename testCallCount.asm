
_testCallCount:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:



int
main()
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp



    int readCount = myMemory();
  11:	e8 03 03 00 00       	call   319 <myMemory>
  16:	89 45 f4             	mov    %eax,-0xc(%ebp)




  
    printf(1, "Return Value: %d\n", readCount);
  19:	83 ec 04             	sub    $0x4,%esp
  1c:	ff 75 f4             	pushl  -0xc(%ebp)
  1f:	68 9f 07 00 00       	push   $0x79f
  24:	6a 01                	push   $0x1
  26:	e8 c8 03 00 00       	call   3f3 <printf>
  2b:	83 c4 10             	add    $0x10,%esp





  exit();
  2e:	e8 3e 02 00 00       	call   271 <exit>

00000033 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  33:	55                   	push   %ebp
  34:	89 e5                	mov    %esp,%ebp
  36:	57                   	push   %edi
  37:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  38:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3b:	8b 55 10             	mov    0x10(%ebp),%edx
  3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  41:	89 cb                	mov    %ecx,%ebx
  43:	89 df                	mov    %ebx,%edi
  45:	89 d1                	mov    %edx,%ecx
  47:	fc                   	cld    
  48:	f3 aa                	rep stos %al,%es:(%edi)
  4a:	89 ca                	mov    %ecx,%edx
  4c:	89 fb                	mov    %edi,%ebx
  4e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  51:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  54:	5b                   	pop    %ebx
  55:	5f                   	pop    %edi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret    

00000058 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  58:	55                   	push   %ebp
  59:	89 e5                	mov    %esp,%ebp
  5b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  5e:	8b 45 08             	mov    0x8(%ebp),%eax
  61:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  64:	90                   	nop
  65:	8b 45 08             	mov    0x8(%ebp),%eax
  68:	8d 50 01             	lea    0x1(%eax),%edx
  6b:	89 55 08             	mov    %edx,0x8(%ebp)
  6e:	8b 55 0c             	mov    0xc(%ebp),%edx
  71:	8d 4a 01             	lea    0x1(%edx),%ecx
  74:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  77:	8a 12                	mov    (%edx),%dl
  79:	88 10                	mov    %dl,(%eax)
  7b:	8a 00                	mov    (%eax),%al
  7d:	84 c0                	test   %al,%al
  7f:	75 e4                	jne    65 <strcpy+0xd>
    ;
  return os;
  81:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  89:	eb 06                	jmp    91 <strcmp+0xb>
    p++, q++;
  8b:	ff 45 08             	incl   0x8(%ebp)
  8e:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	8a 00                	mov    (%eax),%al
  96:	84 c0                	test   %al,%al
  98:	74 0e                	je     a8 <strcmp+0x22>
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	8a 10                	mov    (%eax),%dl
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	8a 00                	mov    (%eax),%al
  a4:	38 c2                	cmp    %al,%dl
  a6:	74 e3                	je     8b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a8:	8b 45 08             	mov    0x8(%ebp),%eax
  ab:	8a 00                	mov    (%eax),%al
  ad:	0f b6 d0             	movzbl %al,%edx
  b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  b3:	8a 00                	mov    (%eax),%al
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	29 c2                	sub    %eax,%edx
  ba:	89 d0                	mov    %edx,%eax
}
  bc:	5d                   	pop    %ebp
  bd:	c3                   	ret    

000000be <strlen>:

uint
strlen(char *s)
{
  be:	55                   	push   %ebp
  bf:	89 e5                	mov    %esp,%ebp
  c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cb:	eb 03                	jmp    d0 <strlen+0x12>
  cd:	ff 45 fc             	incl   -0x4(%ebp)
  d0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	01 d0                	add    %edx,%eax
  d8:	8a 00                	mov    (%eax),%al
  da:	84 c0                	test   %al,%al
  dc:	75 ef                	jne    cd <strlen+0xf>
    ;
  return n;
  de:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e1:	c9                   	leave  
  e2:	c3                   	ret    

000000e3 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e3:	55                   	push   %ebp
  e4:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  e6:	8b 45 10             	mov    0x10(%ebp),%eax
  e9:	50                   	push   %eax
  ea:	ff 75 0c             	pushl  0xc(%ebp)
  ed:	ff 75 08             	pushl  0x8(%ebp)
  f0:	e8 3e ff ff ff       	call   33 <stosb>
  f5:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  fb:	c9                   	leave  
  fc:	c3                   	ret    

000000fd <strchr>:

char*
strchr(const char *s, char c)
{
  fd:	55                   	push   %ebp
  fe:	89 e5                	mov    %esp,%ebp
 100:	83 ec 04             	sub    $0x4,%esp
 103:	8b 45 0c             	mov    0xc(%ebp),%eax
 106:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 109:	eb 12                	jmp    11d <strchr+0x20>
    if(*s == c)
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	8a 00                	mov    (%eax),%al
 110:	3a 45 fc             	cmp    -0x4(%ebp),%al
 113:	75 05                	jne    11a <strchr+0x1d>
      return (char*)s;
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	eb 11                	jmp    12b <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 11a:	ff 45 08             	incl   0x8(%ebp)
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	8a 00                	mov    (%eax),%al
 122:	84 c0                	test   %al,%al
 124:	75 e5                	jne    10b <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 126:	b8 00 00 00 00       	mov    $0x0,%eax
}
 12b:	c9                   	leave  
 12c:	c3                   	ret    

0000012d <gets>:

char*
gets(char *buf, int max)
{
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 133:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 13a:	eb 41                	jmp    17d <gets+0x50>
    cc = read(0, &c, 1);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	6a 01                	push   $0x1
 141:	8d 45 ef             	lea    -0x11(%ebp),%eax
 144:	50                   	push   %eax
 145:	6a 00                	push   $0x0
 147:	e8 3d 01 00 00       	call   289 <read>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 152:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 156:	7f 02                	jg     15a <gets+0x2d>
      break;
 158:	eb 2c                	jmp    186 <gets+0x59>
    buf[i++] = c;
 15a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15d:	8d 50 01             	lea    0x1(%eax),%edx
 160:	89 55 f4             	mov    %edx,-0xc(%ebp)
 163:	89 c2                	mov    %eax,%edx
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	01 c2                	add    %eax,%edx
 16a:	8a 45 ef             	mov    -0x11(%ebp),%al
 16d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16f:	8a 45 ef             	mov    -0x11(%ebp),%al
 172:	3c 0a                	cmp    $0xa,%al
 174:	74 10                	je     186 <gets+0x59>
 176:	8a 45 ef             	mov    -0x11(%ebp),%al
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 09                	je     186 <gets+0x59>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	40                   	inc    %eax
 181:	3b 45 0c             	cmp    0xc(%ebp),%eax
 184:	7c b6                	jl     13c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 186:	8b 55 f4             	mov    -0xc(%ebp),%edx
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	01 d0                	add    %edx,%eax
 18e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 191:	8b 45 08             	mov    0x8(%ebp),%eax
}
 194:	c9                   	leave  
 195:	c3                   	ret    

00000196 <stat>:

int
stat(char *n, struct stat *st)
{
 196:	55                   	push   %ebp
 197:	89 e5                	mov    %esp,%ebp
 199:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19c:	83 ec 08             	sub    $0x8,%esp
 19f:	6a 00                	push   $0x0
 1a1:	ff 75 08             	pushl  0x8(%ebp)
 1a4:	e8 08 01 00 00       	call   2b1 <open>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b3:	79 07                	jns    1bc <stat+0x26>
    return -1;
 1b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ba:	eb 25                	jmp    1e1 <stat+0x4b>
  r = fstat(fd, st);
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	ff 75 0c             	pushl  0xc(%ebp)
 1c2:	ff 75 f4             	pushl  -0xc(%ebp)
 1c5:	e8 ff 00 00 00       	call   2c9 <fstat>
 1ca:	83 c4 10             	add    $0x10,%esp
 1cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d0:	83 ec 0c             	sub    $0xc,%esp
 1d3:	ff 75 f4             	pushl  -0xc(%ebp)
 1d6:	e8 be 00 00 00       	call   299 <close>
 1db:	83 c4 10             	add    $0x10,%esp
  return r;
 1de:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e1:	c9                   	leave  
 1e2:	c3                   	ret    

000001e3 <atoi>:

int
atoi(const char *s)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f0:	eb 24                	jmp    216 <atoi+0x33>
    n = n*10 + *s++ - '0';
 1f2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c1 e0 02             	shl    $0x2,%eax
 1fa:	01 d0                	add    %edx,%eax
 1fc:	01 c0                	add    %eax,%eax
 1fe:	89 c1                	mov    %eax,%ecx
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	8d 50 01             	lea    0x1(%eax),%edx
 206:	89 55 08             	mov    %edx,0x8(%ebp)
 209:	8a 00                	mov    (%eax),%al
 20b:	0f be c0             	movsbl %al,%eax
 20e:	01 c8                	add    %ecx,%eax
 210:	83 e8 30             	sub    $0x30,%eax
 213:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8a 00                	mov    (%eax),%al
 21b:	3c 2f                	cmp    $0x2f,%al
 21d:	7e 09                	jle    228 <atoi+0x45>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	8a 00                	mov    (%eax),%al
 224:	3c 39                	cmp    $0x39,%al
 226:	7e ca                	jle    1f2 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 228:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22b:	c9                   	leave  
 22c:	c3                   	ret    

0000022d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 23f:	eb 16                	jmp    257 <memmove+0x2a>
    *dst++ = *src++;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
 244:	8d 50 01             	lea    0x1(%eax),%edx
 247:	89 55 fc             	mov    %edx,-0x4(%ebp)
 24a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 24d:	8d 4a 01             	lea    0x1(%edx),%ecx
 250:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 253:	8a 12                	mov    (%edx),%dl
 255:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 257:	8b 45 10             	mov    0x10(%ebp),%eax
 25a:	8d 50 ff             	lea    -0x1(%eax),%edx
 25d:	89 55 10             	mov    %edx,0x10(%ebp)
 260:	85 c0                	test   %eax,%eax
 262:	7f dd                	jg     241 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 264:	8b 45 08             	mov    0x8(%ebp),%eax
}
 267:	c9                   	leave  
 268:	c3                   	ret    

00000269 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 269:	b8 01 00 00 00       	mov    $0x1,%eax
 26e:	cd 40                	int    $0x40
 270:	c3                   	ret    

00000271 <exit>:
SYSCALL(exit)
 271:	b8 02 00 00 00       	mov    $0x2,%eax
 276:	cd 40                	int    $0x40
 278:	c3                   	ret    

00000279 <wait>:
SYSCALL(wait)
 279:	b8 03 00 00 00       	mov    $0x3,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret    

00000281 <pipe>:
SYSCALL(pipe)
 281:	b8 04 00 00 00       	mov    $0x4,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret    

00000289 <read>:
SYSCALL(read)
 289:	b8 05 00 00 00       	mov    $0x5,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret    

00000291 <write>:
SYSCALL(write)
 291:	b8 10 00 00 00       	mov    $0x10,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret    

00000299 <close>:
SYSCALL(close)
 299:	b8 15 00 00 00       	mov    $0x15,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret    

000002a1 <kill>:
SYSCALL(kill)
 2a1:	b8 06 00 00 00       	mov    $0x6,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <exec>:
SYSCALL(exec)
 2a9:	b8 07 00 00 00       	mov    $0x7,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <open>:
SYSCALL(open)
 2b1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <mknod>:
SYSCALL(mknod)
 2b9:	b8 11 00 00 00       	mov    $0x11,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <unlink>:
SYSCALL(unlink)
 2c1:	b8 12 00 00 00       	mov    $0x12,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <fstat>:
SYSCALL(fstat)
 2c9:	b8 08 00 00 00       	mov    $0x8,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <link>:
SYSCALL(link)
 2d1:	b8 13 00 00 00       	mov    $0x13,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <mkdir>:
SYSCALL(mkdir)
 2d9:	b8 14 00 00 00       	mov    $0x14,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <chdir>:
SYSCALL(chdir)
 2e1:	b8 09 00 00 00       	mov    $0x9,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <dup>:
SYSCALL(dup)
 2e9:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <getpid>:
SYSCALL(getpid)
 2f1:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <sbrk>:
SYSCALL(sbrk)
 2f9:	b8 0c 00 00 00       	mov    $0xc,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <sleep>:
SYSCALL(sleep)
 301:	b8 0d 00 00 00       	mov    $0xd,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <uptime>:
SYSCALL(uptime)
 309:	b8 0e 00 00 00       	mov    $0xe,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <getCallCount>:
SYSCALL(getCallCount)
 311:	b8 16 00 00 00       	mov    $0x16,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <myMemory>:
SYSCALL(myMemory)
 319:	b8 17 00 00 00       	mov    $0x17,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 18             	sub    $0x18,%esp
 327:	8b 45 0c             	mov    0xc(%ebp),%eax
 32a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 32d:	83 ec 04             	sub    $0x4,%esp
 330:	6a 01                	push   $0x1
 332:	8d 45 f4             	lea    -0xc(%ebp),%eax
 335:	50                   	push   %eax
 336:	ff 75 08             	pushl  0x8(%ebp)
 339:	e8 53 ff ff ff       	call   291 <write>
 33e:	83 c4 10             	add    $0x10,%esp
}
 341:	c9                   	leave  
 342:	c3                   	ret    

00000343 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	53                   	push   %ebx
 347:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 34a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 351:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 355:	74 17                	je     36e <printint+0x2b>
 357:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 35b:	79 11                	jns    36e <printint+0x2b>
    neg = 1;
 35d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	f7 d8                	neg    %eax
 369:	89 45 ec             	mov    %eax,-0x14(%ebp)
 36c:	eb 06                	jmp    374 <printint+0x31>
  } else {
    x = xx;
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 374:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 37b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 37e:	8d 41 01             	lea    0x1(%ecx),%eax
 381:	89 45 f4             	mov    %eax,-0xc(%ebp)
 384:	8b 5d 10             	mov    0x10(%ebp),%ebx
 387:	8b 45 ec             	mov    -0x14(%ebp),%eax
 38a:	ba 00 00 00 00       	mov    $0x0,%edx
 38f:	f7 f3                	div    %ebx
 391:	89 d0                	mov    %edx,%eax
 393:	8a 80 00 0a 00 00    	mov    0xa00(%eax),%al
 399:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 39d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3a3:	ba 00 00 00 00       	mov    $0x0,%edx
 3a8:	f7 f3                	div    %ebx
 3aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3b1:	75 c8                	jne    37b <printint+0x38>
  if(neg)
 3b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3b7:	74 0e                	je     3c7 <printint+0x84>
    buf[i++] = '-';
 3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3bc:	8d 50 01             	lea    0x1(%eax),%edx
 3bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3c7:	eb 1c                	jmp    3e5 <printint+0xa2>
    putc(fd, buf[i]);
 3c9:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cf:	01 d0                	add    %edx,%eax
 3d1:	8a 00                	mov    (%eax),%al
 3d3:	0f be c0             	movsbl %al,%eax
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	50                   	push   %eax
 3da:	ff 75 08             	pushl  0x8(%ebp)
 3dd:	e8 3f ff ff ff       	call   321 <putc>
 3e2:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3e5:	ff 4d f4             	decl   -0xc(%ebp)
 3e8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3ec:	79 db                	jns    3c9 <printint+0x86>
    putc(fd, buf[i]);
}
 3ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3f1:	c9                   	leave  
 3f2:	c3                   	ret    

000003f3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 400:	8d 45 0c             	lea    0xc(%ebp),%eax
 403:	83 c0 04             	add    $0x4,%eax
 406:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 409:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 410:	e9 54 01 00 00       	jmp    569 <printf+0x176>
    c = fmt[i] & 0xff;
 415:	8b 55 0c             	mov    0xc(%ebp),%edx
 418:	8b 45 f0             	mov    -0x10(%ebp),%eax
 41b:	01 d0                	add    %edx,%eax
 41d:	8a 00                	mov    (%eax),%al
 41f:	0f be c0             	movsbl %al,%eax
 422:	25 ff 00 00 00       	and    $0xff,%eax
 427:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 42a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 42e:	75 2c                	jne    45c <printf+0x69>
      if(c == '%'){
 430:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 434:	75 0c                	jne    442 <printf+0x4f>
        state = '%';
 436:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 43d:	e9 24 01 00 00       	jmp    566 <printf+0x173>
      } else {
        putc(fd, c);
 442:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 445:	0f be c0             	movsbl %al,%eax
 448:	83 ec 08             	sub    $0x8,%esp
 44b:	50                   	push   %eax
 44c:	ff 75 08             	pushl  0x8(%ebp)
 44f:	e8 cd fe ff ff       	call   321 <putc>
 454:	83 c4 10             	add    $0x10,%esp
 457:	e9 0a 01 00 00       	jmp    566 <printf+0x173>
      }
    } else if(state == '%'){
 45c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 460:	0f 85 00 01 00 00    	jne    566 <printf+0x173>
      if(c == 'd'){
 466:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 46a:	75 1e                	jne    48a <printf+0x97>
        printint(fd, *ap, 10, 1);
 46c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 46f:	8b 00                	mov    (%eax),%eax
 471:	6a 01                	push   $0x1
 473:	6a 0a                	push   $0xa
 475:	50                   	push   %eax
 476:	ff 75 08             	pushl  0x8(%ebp)
 479:	e8 c5 fe ff ff       	call   343 <printint>
 47e:	83 c4 10             	add    $0x10,%esp
        ap++;
 481:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 485:	e9 d5 00 00 00       	jmp    55f <printf+0x16c>
      } else if(c == 'x' || c == 'p'){
 48a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 48e:	74 06                	je     496 <printf+0xa3>
 490:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 494:	75 1e                	jne    4b4 <printf+0xc1>
        printint(fd, *ap, 16, 0);
 496:	8b 45 e8             	mov    -0x18(%ebp),%eax
 499:	8b 00                	mov    (%eax),%eax
 49b:	6a 00                	push   $0x0
 49d:	6a 10                	push   $0x10
 49f:	50                   	push   %eax
 4a0:	ff 75 08             	pushl  0x8(%ebp)
 4a3:	e8 9b fe ff ff       	call   343 <printint>
 4a8:	83 c4 10             	add    $0x10,%esp
        ap++;
 4ab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4af:	e9 ab 00 00 00       	jmp    55f <printf+0x16c>
      } else if(c == 's'){
 4b4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4b8:	75 40                	jne    4fa <printf+0x107>
        s = (char*)*ap;
 4ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4bd:	8b 00                	mov    (%eax),%eax
 4bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4c2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4ca:	75 07                	jne    4d3 <printf+0xe0>
          s = "(null)";
 4cc:	c7 45 f4 b1 07 00 00 	movl   $0x7b1,-0xc(%ebp)
        while(*s != 0){
 4d3:	eb 1a                	jmp    4ef <printf+0xfc>
          putc(fd, *s);
 4d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d8:	8a 00                	mov    (%eax),%al
 4da:	0f be c0             	movsbl %al,%eax
 4dd:	83 ec 08             	sub    $0x8,%esp
 4e0:	50                   	push   %eax
 4e1:	ff 75 08             	pushl  0x8(%ebp)
 4e4:	e8 38 fe ff ff       	call   321 <putc>
 4e9:	83 c4 10             	add    $0x10,%esp
          s++;
 4ec:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f2:	8a 00                	mov    (%eax),%al
 4f4:	84 c0                	test   %al,%al
 4f6:	75 dd                	jne    4d5 <printf+0xe2>
 4f8:	eb 65                	jmp    55f <printf+0x16c>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4fa:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 4fe:	75 1d                	jne    51d <printf+0x12a>
        putc(fd, *ap);
 500:	8b 45 e8             	mov    -0x18(%ebp),%eax
 503:	8b 00                	mov    (%eax),%eax
 505:	0f be c0             	movsbl %al,%eax
 508:	83 ec 08             	sub    $0x8,%esp
 50b:	50                   	push   %eax
 50c:	ff 75 08             	pushl  0x8(%ebp)
 50f:	e8 0d fe ff ff       	call   321 <putc>
 514:	83 c4 10             	add    $0x10,%esp
        ap++;
 517:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51b:	eb 42                	jmp    55f <printf+0x16c>
      } else if(c == '%'){
 51d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 521:	75 17                	jne    53a <printf+0x147>
        putc(fd, c);
 523:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 526:	0f be c0             	movsbl %al,%eax
 529:	83 ec 08             	sub    $0x8,%esp
 52c:	50                   	push   %eax
 52d:	ff 75 08             	pushl  0x8(%ebp)
 530:	e8 ec fd ff ff       	call   321 <putc>
 535:	83 c4 10             	add    $0x10,%esp
 538:	eb 25                	jmp    55f <printf+0x16c>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	6a 25                	push   $0x25
 53f:	ff 75 08             	pushl  0x8(%ebp)
 542:	e8 da fd ff ff       	call   321 <putc>
 547:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 54a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54d:	0f be c0             	movsbl %al,%eax
 550:	83 ec 08             	sub    $0x8,%esp
 553:	50                   	push   %eax
 554:	ff 75 08             	pushl  0x8(%ebp)
 557:	e8 c5 fd ff ff       	call   321 <putc>
 55c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 55f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 566:	ff 45 f0             	incl   -0x10(%ebp)
 569:	8b 55 0c             	mov    0xc(%ebp),%edx
 56c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 56f:	01 d0                	add    %edx,%eax
 571:	8a 00                	mov    (%eax),%al
 573:	84 c0                	test   %al,%al
 575:	0f 85 9a fe ff ff    	jne    415 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 57b:	c9                   	leave  
 57c:	c3                   	ret    

0000057d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	83 e8 08             	sub    $0x8,%eax
 589:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 58c:	a1 1c 0a 00 00       	mov    0xa1c,%eax
 591:	89 45 fc             	mov    %eax,-0x4(%ebp)
 594:	eb 24                	jmp    5ba <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 596:	8b 45 fc             	mov    -0x4(%ebp),%eax
 599:	8b 00                	mov    (%eax),%eax
 59b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 59e:	77 12                	ja     5b2 <free+0x35>
 5a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5a3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5a6:	77 24                	ja     5cc <free+0x4f>
 5a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5b0:	77 1a                	ja     5cc <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5b5:	8b 00                	mov    (%eax),%eax
 5b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5bd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5c0:	76 d4                	jbe    596 <free+0x19>
 5c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5c5:	8b 00                	mov    (%eax),%eax
 5c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5ca:	76 ca                	jbe    596 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5cf:	8b 40 04             	mov    0x4(%eax),%eax
 5d2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 5d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5dc:	01 c2                	add    %eax,%edx
 5de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e1:	8b 00                	mov    (%eax),%eax
 5e3:	39 c2                	cmp    %eax,%edx
 5e5:	75 24                	jne    60b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 5e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ea:	8b 50 04             	mov    0x4(%eax),%edx
 5ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f0:	8b 00                	mov    (%eax),%eax
 5f2:	8b 40 04             	mov    0x4(%eax),%eax
 5f5:	01 c2                	add    %eax,%edx
 5f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fa:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 5fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	8b 10                	mov    (%eax),%edx
 604:	8b 45 f8             	mov    -0x8(%ebp),%eax
 607:	89 10                	mov    %edx,(%eax)
 609:	eb 0a                	jmp    615 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 60b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60e:	8b 10                	mov    (%eax),%edx
 610:	8b 45 f8             	mov    -0x8(%ebp),%eax
 613:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 615:	8b 45 fc             	mov    -0x4(%ebp),%eax
 618:	8b 40 04             	mov    0x4(%eax),%eax
 61b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 622:	8b 45 fc             	mov    -0x4(%ebp),%eax
 625:	01 d0                	add    %edx,%eax
 627:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62a:	75 20                	jne    64c <free+0xcf>
    p->s.size += bp->s.size;
 62c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62f:	8b 50 04             	mov    0x4(%eax),%edx
 632:	8b 45 f8             	mov    -0x8(%ebp),%eax
 635:	8b 40 04             	mov    0x4(%eax),%eax
 638:	01 c2                	add    %eax,%edx
 63a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 640:	8b 45 f8             	mov    -0x8(%ebp),%eax
 643:	8b 10                	mov    (%eax),%edx
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	89 10                	mov    %edx,(%eax)
 64a:	eb 08                	jmp    654 <free+0xd7>
  } else
    p->s.ptr = bp;
 64c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 652:	89 10                	mov    %edx,(%eax)
  freep = p;
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	a3 1c 0a 00 00       	mov    %eax,0xa1c
}
 65c:	c9                   	leave  
 65d:	c3                   	ret    

0000065e <morecore>:

static Header*
morecore(uint nu)
{
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 664:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 66b:	77 07                	ja     674 <morecore+0x16>
    nu = 4096;
 66d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	c1 e0 03             	shl    $0x3,%eax
 67a:	83 ec 0c             	sub    $0xc,%esp
 67d:	50                   	push   %eax
 67e:	e8 76 fc ff ff       	call   2f9 <sbrk>
 683:	83 c4 10             	add    $0x10,%esp
 686:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 689:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 68d:	75 07                	jne    696 <morecore+0x38>
    return 0;
 68f:	b8 00 00 00 00       	mov    $0x0,%eax
 694:	eb 26                	jmp    6bc <morecore+0x5e>
  hp = (Header*)p;
 696:	8b 45 f4             	mov    -0xc(%ebp),%eax
 699:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 69c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 69f:	8b 55 08             	mov    0x8(%ebp),%edx
 6a2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a8:	83 c0 08             	add    $0x8,%eax
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	50                   	push   %eax
 6af:	e8 c9 fe ff ff       	call   57d <free>
 6b4:	83 c4 10             	add    $0x10,%esp
  return freep;
 6b7:	a1 1c 0a 00 00       	mov    0xa1c,%eax
}
 6bc:	c9                   	leave  
 6bd:	c3                   	ret    

000006be <malloc>:

void*
malloc(uint nbytes)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	83 c0 07             	add    $0x7,%eax
 6ca:	c1 e8 03             	shr    $0x3,%eax
 6cd:	40                   	inc    %eax
 6ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 6d1:	a1 1c 0a 00 00       	mov    0xa1c,%eax
 6d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 6d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6dd:	75 23                	jne    702 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 6df:	c7 45 f0 14 0a 00 00 	movl   $0xa14,-0x10(%ebp)
 6e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e9:	a3 1c 0a 00 00       	mov    %eax,0xa1c
 6ee:	a1 1c 0a 00 00       	mov    0xa1c,%eax
 6f3:	a3 14 0a 00 00       	mov    %eax,0xa14
    base.s.size = 0;
 6f8:	c7 05 18 0a 00 00 00 	movl   $0x0,0xa18
 6ff:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 702:	8b 45 f0             	mov    -0x10(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 70a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70d:	8b 40 04             	mov    0x4(%eax),%eax
 710:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 713:	72 4d                	jb     762 <malloc+0xa4>
      if(p->s.size == nunits)
 715:	8b 45 f4             	mov    -0xc(%ebp),%eax
 718:	8b 40 04             	mov    0x4(%eax),%eax
 71b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 71e:	75 0c                	jne    72c <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 720:	8b 45 f4             	mov    -0xc(%ebp),%eax
 723:	8b 10                	mov    (%eax),%edx
 725:	8b 45 f0             	mov    -0x10(%ebp),%eax
 728:	89 10                	mov    %edx,(%eax)
 72a:	eb 26                	jmp    752 <malloc+0x94>
      else {
        p->s.size -= nunits;
 72c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72f:	8b 40 04             	mov    0x4(%eax),%eax
 732:	2b 45 ec             	sub    -0x14(%ebp),%eax
 735:	89 c2                	mov    %eax,%edx
 737:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 740:	8b 40 04             	mov    0x4(%eax),%eax
 743:	c1 e0 03             	shl    $0x3,%eax
 746:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 749:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 74f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 752:	8b 45 f0             	mov    -0x10(%ebp),%eax
 755:	a3 1c 0a 00 00       	mov    %eax,0xa1c
      return (void*)(p + 1);
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	83 c0 08             	add    $0x8,%eax
 760:	eb 3b                	jmp    79d <malloc+0xdf>
    }
    if(p == freep)
 762:	a1 1c 0a 00 00       	mov    0xa1c,%eax
 767:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 76a:	75 1e                	jne    78a <malloc+0xcc>
      if((p = morecore(nunits)) == 0)
 76c:	83 ec 0c             	sub    $0xc,%esp
 76f:	ff 75 ec             	pushl  -0x14(%ebp)
 772:	e8 e7 fe ff ff       	call   65e <morecore>
 777:	83 c4 10             	add    $0x10,%esp
 77a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 77d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 781:	75 07                	jne    78a <malloc+0xcc>
        return 0;
 783:	b8 00 00 00 00       	mov    $0x0,%eax
 788:	eb 13                	jmp    79d <malloc+0xdf>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 78a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 790:	8b 45 f4             	mov    -0xc(%ebp),%eax
 793:	8b 00                	mov    (%eax),%eax
 795:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 798:	e9 6d ff ff ff       	jmp    70a <malloc+0x4c>
}
 79d:	c9                   	leave  
 79e:	c3                   	ret    
