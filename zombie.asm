
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 4c 02 00 00       	call   262 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 d6 02 00 00       	call   2fa <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 3e 02 00 00       	call   26a <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	5b                   	pop    %ebx
  4e:	5f                   	pop    %edi
  4f:	5d                   	pop    %ebp
  50:	c3                   	ret    

00000051 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  57:	8b 45 08             	mov    0x8(%ebp),%eax
  5a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5d:	90                   	nop
  5e:	8b 45 08             	mov    0x8(%ebp),%eax
  61:	8d 50 01             	lea    0x1(%eax),%edx
  64:	89 55 08             	mov    %edx,0x8(%ebp)
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  6a:	8d 4a 01             	lea    0x1(%edx),%ecx
  6d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  70:	8a 12                	mov    (%edx),%dl
  72:	88 10                	mov    %dl,(%eax)
  74:	8a 00                	mov    (%eax),%al
  76:	84 c0                	test   %al,%al
  78:	75 e4                	jne    5e <strcpy+0xd>
    ;
  return os;
  7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7d:	c9                   	leave  
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  82:	eb 06                	jmp    8a <strcmp+0xb>
    p++, q++;
  84:	ff 45 08             	incl   0x8(%ebp)
  87:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8a:	8b 45 08             	mov    0x8(%ebp),%eax
  8d:	8a 00                	mov    (%eax),%al
  8f:	84 c0                	test   %al,%al
  91:	74 0e                	je     a1 <strcmp+0x22>
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	8a 10                	mov    (%eax),%dl
  98:	8b 45 0c             	mov    0xc(%ebp),%eax
  9b:	8a 00                	mov    (%eax),%al
  9d:	38 c2                	cmp    %al,%dl
  9f:	74 e3                	je     84 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	8a 00                	mov    (%eax),%al
  a6:	0f b6 d0             	movzbl %al,%edx
  a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ac:	8a 00                	mov    (%eax),%al
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 03                	jmp    c9 <strlen+0x12>
  c6:	ff 45 fc             	incl   -0x4(%ebp)
  c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cf:	01 d0                	add    %edx,%eax
  d1:	8a 00                	mov    (%eax),%al
  d3:	84 c0                	test   %al,%al
  d5:	75 ef                	jne    c6 <strlen+0xf>
    ;
  return n;
  d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  da:	c9                   	leave  
  db:	c3                   	ret    

000000dc <memset>:

void*
memset(void *dst, int c, uint n)
{
  dc:	55                   	push   %ebp
  dd:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  df:	8b 45 10             	mov    0x10(%ebp),%eax
  e2:	50                   	push   %eax
  e3:	ff 75 0c             	pushl  0xc(%ebp)
  e6:	ff 75 08             	pushl  0x8(%ebp)
  e9:	e8 3e ff ff ff       	call   2c <stosb>
  ee:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
}
  f4:	c9                   	leave  
  f5:	c3                   	ret    

000000f6 <strchr>:

char*
strchr(const char *s, char c)
{
  f6:	55                   	push   %ebp
  f7:	89 e5                	mov    %esp,%ebp
  f9:	83 ec 04             	sub    $0x4,%esp
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 102:	eb 12                	jmp    116 <strchr+0x20>
    if(*s == c)
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	8a 00                	mov    (%eax),%al
 109:	3a 45 fc             	cmp    -0x4(%ebp),%al
 10c:	75 05                	jne    113 <strchr+0x1d>
      return (char*)s;
 10e:	8b 45 08             	mov    0x8(%ebp),%eax
 111:	eb 11                	jmp    124 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 113:	ff 45 08             	incl   0x8(%ebp)
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	8a 00                	mov    (%eax),%al
 11b:	84 c0                	test   %al,%al
 11d:	75 e5                	jne    104 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 11f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <gets>:

char*
gets(char *buf, int max)
{
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 12c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 133:	eb 41                	jmp    176 <gets+0x50>
    cc = read(0, &c, 1);
 135:	83 ec 04             	sub    $0x4,%esp
 138:	6a 01                	push   $0x1
 13a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13d:	50                   	push   %eax
 13e:	6a 00                	push   $0x0
 140:	e8 3d 01 00 00       	call   282 <read>
 145:	83 c4 10             	add    $0x10,%esp
 148:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 14f:	7f 02                	jg     153 <gets+0x2d>
      break;
 151:	eb 2c                	jmp    17f <gets+0x59>
    buf[i++] = c;
 153:	8b 45 f4             	mov    -0xc(%ebp),%eax
 156:	8d 50 01             	lea    0x1(%eax),%edx
 159:	89 55 f4             	mov    %edx,-0xc(%ebp)
 15c:	89 c2                	mov    %eax,%edx
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	01 c2                	add    %eax,%edx
 163:	8a 45 ef             	mov    -0x11(%ebp),%al
 166:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 168:	8a 45 ef             	mov    -0x11(%ebp),%al
 16b:	3c 0a                	cmp    $0xa,%al
 16d:	74 10                	je     17f <gets+0x59>
 16f:	8a 45 ef             	mov    -0x11(%ebp),%al
 172:	3c 0d                	cmp    $0xd,%al
 174:	74 09                	je     17f <gets+0x59>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 176:	8b 45 f4             	mov    -0xc(%ebp),%eax
 179:	40                   	inc    %eax
 17a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 17d:	7c b6                	jl     135 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 17f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 182:	8b 45 08             	mov    0x8(%ebp),%eax
 185:	01 d0                	add    %edx,%eax
 187:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 18d:	c9                   	leave  
 18e:	c3                   	ret    

0000018f <stat>:

int
stat(char *n, struct stat *st)
{
 18f:	55                   	push   %ebp
 190:	89 e5                	mov    %esp,%ebp
 192:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	pushl  0x8(%ebp)
 19d:	e8 08 01 00 00       	call   2aa <open>
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ac:	79 07                	jns    1b5 <stat+0x26>
    return -1;
 1ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1b3:	eb 25                	jmp    1da <stat+0x4b>
  r = fstat(fd, st);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	ff 75 0c             	pushl  0xc(%ebp)
 1bb:	ff 75 f4             	pushl  -0xc(%ebp)
 1be:	e8 ff 00 00 00       	call   2c2 <fstat>
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1c9:	83 ec 0c             	sub    $0xc,%esp
 1cc:	ff 75 f4             	pushl  -0xc(%ebp)
 1cf:	e8 be 00 00 00       	call   292 <close>
 1d4:	83 c4 10             	add    $0x10,%esp
  return r;
 1d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1da:	c9                   	leave  
 1db:	c3                   	ret    

000001dc <atoi>:

int
atoi(const char *s)
{
 1dc:	55                   	push   %ebp
 1dd:	89 e5                	mov    %esp,%ebp
 1df:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1e9:	eb 24                	jmp    20f <atoi+0x33>
    n = n*10 + *s++ - '0';
 1eb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ee:	89 d0                	mov    %edx,%eax
 1f0:	c1 e0 02             	shl    $0x2,%eax
 1f3:	01 d0                	add    %edx,%eax
 1f5:	01 c0                	add    %eax,%eax
 1f7:	89 c1                	mov    %eax,%ecx
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	8d 50 01             	lea    0x1(%eax),%edx
 1ff:	89 55 08             	mov    %edx,0x8(%ebp)
 202:	8a 00                	mov    (%eax),%al
 204:	0f be c0             	movsbl %al,%eax
 207:	01 c8                	add    %ecx,%eax
 209:	83 e8 30             	sub    $0x30,%eax
 20c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	8a 00                	mov    (%eax),%al
 214:	3c 2f                	cmp    $0x2f,%al
 216:	7e 09                	jle    221 <atoi+0x45>
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	8a 00                	mov    (%eax),%al
 21d:	3c 39                	cmp    $0x39,%al
 21f:	7e ca                	jle    1eb <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 221:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 224:	c9                   	leave  
 225:	c3                   	ret    

00000226 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
 22f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 232:	8b 45 0c             	mov    0xc(%ebp),%eax
 235:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 238:	eb 16                	jmp    250 <memmove+0x2a>
    *dst++ = *src++;
 23a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 23d:	8d 50 01             	lea    0x1(%eax),%edx
 240:	89 55 fc             	mov    %edx,-0x4(%ebp)
 243:	8b 55 f8             	mov    -0x8(%ebp),%edx
 246:	8d 4a 01             	lea    0x1(%edx),%ecx
 249:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 24c:	8a 12                	mov    (%edx),%dl
 24e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 250:	8b 45 10             	mov    0x10(%ebp),%eax
 253:	8d 50 ff             	lea    -0x1(%eax),%edx
 256:	89 55 10             	mov    %edx,0x10(%ebp)
 259:	85 c0                	test   %eax,%eax
 25b:	7f dd                	jg     23a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 262:	b8 01 00 00 00       	mov    $0x1,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <exit>:
SYSCALL(exit)
 26a:	b8 02 00 00 00       	mov    $0x2,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <wait>:
SYSCALL(wait)
 272:	b8 03 00 00 00       	mov    $0x3,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <pipe>:
SYSCALL(pipe)
 27a:	b8 04 00 00 00       	mov    $0x4,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <read>:
SYSCALL(read)
 282:	b8 05 00 00 00       	mov    $0x5,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <write>:
SYSCALL(write)
 28a:	b8 10 00 00 00       	mov    $0x10,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <close>:
SYSCALL(close)
 292:	b8 15 00 00 00       	mov    $0x15,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <kill>:
SYSCALL(kill)
 29a:	b8 06 00 00 00       	mov    $0x6,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <exec>:
SYSCALL(exec)
 2a2:	b8 07 00 00 00       	mov    $0x7,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <open>:
SYSCALL(open)
 2aa:	b8 0f 00 00 00       	mov    $0xf,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <mknod>:
SYSCALL(mknod)
 2b2:	b8 11 00 00 00       	mov    $0x11,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <unlink>:
SYSCALL(unlink)
 2ba:	b8 12 00 00 00       	mov    $0x12,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <fstat>:
SYSCALL(fstat)
 2c2:	b8 08 00 00 00       	mov    $0x8,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <link>:
SYSCALL(link)
 2ca:	b8 13 00 00 00       	mov    $0x13,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <mkdir>:
SYSCALL(mkdir)
 2d2:	b8 14 00 00 00       	mov    $0x14,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <chdir>:
SYSCALL(chdir)
 2da:	b8 09 00 00 00       	mov    $0x9,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <dup>:
SYSCALL(dup)
 2e2:	b8 0a 00 00 00       	mov    $0xa,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <getpid>:
SYSCALL(getpid)
 2ea:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <sbrk>:
SYSCALL(sbrk)
 2f2:	b8 0c 00 00 00       	mov    $0xc,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <sleep>:
SYSCALL(sleep)
 2fa:	b8 0d 00 00 00       	mov    $0xd,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <uptime>:
SYSCALL(uptime)
 302:	b8 0e 00 00 00       	mov    $0xe,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <getCallCount>:
SYSCALL(getCallCount)
 30a:	b8 16 00 00 00       	mov    $0x16,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <myMemory>:
SYSCALL(myMemory)
 312:	b8 17 00 00 00       	mov    $0x17,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	83 ec 18             	sub    $0x18,%esp
 320:	8b 45 0c             	mov    0xc(%ebp),%eax
 323:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 326:	83 ec 04             	sub    $0x4,%esp
 329:	6a 01                	push   $0x1
 32b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 32e:	50                   	push   %eax
 32f:	ff 75 08             	pushl  0x8(%ebp)
 332:	e8 53 ff ff ff       	call   28a <write>
 337:	83 c4 10             	add    $0x10,%esp
}
 33a:	c9                   	leave  
 33b:	c3                   	ret    

0000033c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	53                   	push   %ebx
 340:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 343:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 34a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 34e:	74 17                	je     367 <printint+0x2b>
 350:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 354:	79 11                	jns    367 <printint+0x2b>
    neg = 1;
 356:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 35d:	8b 45 0c             	mov    0xc(%ebp),%eax
 360:	f7 d8                	neg    %eax
 362:	89 45 ec             	mov    %eax,-0x14(%ebp)
 365:	eb 06                	jmp    36d <printint+0x31>
  } else {
    x = xx;
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 36d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 374:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 377:	8d 41 01             	lea    0x1(%ecx),%eax
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 37d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 380:	8b 45 ec             	mov    -0x14(%ebp),%eax
 383:	ba 00 00 00 00       	mov    $0x0,%edx
 388:	f7 f3                	div    %ebx
 38a:	89 d0                	mov    %edx,%eax
 38c:	8a 80 e8 09 00 00    	mov    0x9e8(%eax),%al
 392:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 396:	8b 5d 10             	mov    0x10(%ebp),%ebx
 399:	8b 45 ec             	mov    -0x14(%ebp),%eax
 39c:	ba 00 00 00 00       	mov    $0x0,%edx
 3a1:	f7 f3                	div    %ebx
 3a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3a6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3aa:	75 c8                	jne    374 <printint+0x38>
  if(neg)
 3ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3b0:	74 0e                	je     3c0 <printint+0x84>
    buf[i++] = '-';
 3b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b5:	8d 50 01             	lea    0x1(%eax),%edx
 3b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3bb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3c0:	eb 1c                	jmp    3de <printint+0xa2>
    putc(fd, buf[i]);
 3c2:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c8:	01 d0                	add    %edx,%eax
 3ca:	8a 00                	mov    (%eax),%al
 3cc:	0f be c0             	movsbl %al,%eax
 3cf:	83 ec 08             	sub    $0x8,%esp
 3d2:	50                   	push   %eax
 3d3:	ff 75 08             	pushl  0x8(%ebp)
 3d6:	e8 3f ff ff ff       	call   31a <putc>
 3db:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3de:	ff 4d f4             	decl   -0xc(%ebp)
 3e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3e5:	79 db                	jns    3c2 <printint+0x86>
    putc(fd, buf[i]);
}
 3e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3ea:	c9                   	leave  
 3eb:	c3                   	ret    

000003ec <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3f2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 3f9:	8d 45 0c             	lea    0xc(%ebp),%eax
 3fc:	83 c0 04             	add    $0x4,%eax
 3ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 402:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 409:	e9 54 01 00 00       	jmp    562 <printf+0x176>
    c = fmt[i] & 0xff;
 40e:	8b 55 0c             	mov    0xc(%ebp),%edx
 411:	8b 45 f0             	mov    -0x10(%ebp),%eax
 414:	01 d0                	add    %edx,%eax
 416:	8a 00                	mov    (%eax),%al
 418:	0f be c0             	movsbl %al,%eax
 41b:	25 ff 00 00 00       	and    $0xff,%eax
 420:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 423:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 427:	75 2c                	jne    455 <printf+0x69>
      if(c == '%'){
 429:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 42d:	75 0c                	jne    43b <printf+0x4f>
        state = '%';
 42f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 436:	e9 24 01 00 00       	jmp    55f <printf+0x173>
      } else {
        putc(fd, c);
 43b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 43e:	0f be c0             	movsbl %al,%eax
 441:	83 ec 08             	sub    $0x8,%esp
 444:	50                   	push   %eax
 445:	ff 75 08             	pushl  0x8(%ebp)
 448:	e8 cd fe ff ff       	call   31a <putc>
 44d:	83 c4 10             	add    $0x10,%esp
 450:	e9 0a 01 00 00       	jmp    55f <printf+0x173>
      }
    } else if(state == '%'){
 455:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 459:	0f 85 00 01 00 00    	jne    55f <printf+0x173>
      if(c == 'd'){
 45f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 463:	75 1e                	jne    483 <printf+0x97>
        printint(fd, *ap, 10, 1);
 465:	8b 45 e8             	mov    -0x18(%ebp),%eax
 468:	8b 00                	mov    (%eax),%eax
 46a:	6a 01                	push   $0x1
 46c:	6a 0a                	push   $0xa
 46e:	50                   	push   %eax
 46f:	ff 75 08             	pushl  0x8(%ebp)
 472:	e8 c5 fe ff ff       	call   33c <printint>
 477:	83 c4 10             	add    $0x10,%esp
        ap++;
 47a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 47e:	e9 d5 00 00 00       	jmp    558 <printf+0x16c>
      } else if(c == 'x' || c == 'p'){
 483:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 487:	74 06                	je     48f <printf+0xa3>
 489:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 48d:	75 1e                	jne    4ad <printf+0xc1>
        printint(fd, *ap, 16, 0);
 48f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 492:	8b 00                	mov    (%eax),%eax
 494:	6a 00                	push   $0x0
 496:	6a 10                	push   $0x10
 498:	50                   	push   %eax
 499:	ff 75 08             	pushl  0x8(%ebp)
 49c:	e8 9b fe ff ff       	call   33c <printint>
 4a1:	83 c4 10             	add    $0x10,%esp
        ap++;
 4a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4a8:	e9 ab 00 00 00       	jmp    558 <printf+0x16c>
      } else if(c == 's'){
 4ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4b1:	75 40                	jne    4f3 <printf+0x107>
        s = (char*)*ap;
 4b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b6:	8b 00                	mov    (%eax),%eax
 4b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c3:	75 07                	jne    4cc <printf+0xe0>
          s = "(null)";
 4c5:	c7 45 f4 98 07 00 00 	movl   $0x798,-0xc(%ebp)
        while(*s != 0){
 4cc:	eb 1a                	jmp    4e8 <printf+0xfc>
          putc(fd, *s);
 4ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d1:	8a 00                	mov    (%eax),%al
 4d3:	0f be c0             	movsbl %al,%eax
 4d6:	83 ec 08             	sub    $0x8,%esp
 4d9:	50                   	push   %eax
 4da:	ff 75 08             	pushl  0x8(%ebp)
 4dd:	e8 38 fe ff ff       	call   31a <putc>
 4e2:	83 c4 10             	add    $0x10,%esp
          s++;
 4e5:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4eb:	8a 00                	mov    (%eax),%al
 4ed:	84 c0                	test   %al,%al
 4ef:	75 dd                	jne    4ce <printf+0xe2>
 4f1:	eb 65                	jmp    558 <printf+0x16c>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4f3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 4f7:	75 1d                	jne    516 <printf+0x12a>
        putc(fd, *ap);
 4f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fc:	8b 00                	mov    (%eax),%eax
 4fe:	0f be c0             	movsbl %al,%eax
 501:	83 ec 08             	sub    $0x8,%esp
 504:	50                   	push   %eax
 505:	ff 75 08             	pushl  0x8(%ebp)
 508:	e8 0d fe ff ff       	call   31a <putc>
 50d:	83 c4 10             	add    $0x10,%esp
        ap++;
 510:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 514:	eb 42                	jmp    558 <printf+0x16c>
      } else if(c == '%'){
 516:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 51a:	75 17                	jne    533 <printf+0x147>
        putc(fd, c);
 51c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51f:	0f be c0             	movsbl %al,%eax
 522:	83 ec 08             	sub    $0x8,%esp
 525:	50                   	push   %eax
 526:	ff 75 08             	pushl  0x8(%ebp)
 529:	e8 ec fd ff ff       	call   31a <putc>
 52e:	83 c4 10             	add    $0x10,%esp
 531:	eb 25                	jmp    558 <printf+0x16c>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 533:	83 ec 08             	sub    $0x8,%esp
 536:	6a 25                	push   $0x25
 538:	ff 75 08             	pushl  0x8(%ebp)
 53b:	e8 da fd ff ff       	call   31a <putc>
 540:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 543:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 546:	0f be c0             	movsbl %al,%eax
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	50                   	push   %eax
 54d:	ff 75 08             	pushl  0x8(%ebp)
 550:	e8 c5 fd ff ff       	call   31a <putc>
 555:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 558:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 55f:	ff 45 f0             	incl   -0x10(%ebp)
 562:	8b 55 0c             	mov    0xc(%ebp),%edx
 565:	8b 45 f0             	mov    -0x10(%ebp),%eax
 568:	01 d0                	add    %edx,%eax
 56a:	8a 00                	mov    (%eax),%al
 56c:	84 c0                	test   %al,%al
 56e:	0f 85 9a fe ff ff    	jne    40e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 574:	c9                   	leave  
 575:	c3                   	ret    

00000576 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	83 e8 08             	sub    $0x8,%eax
 582:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 585:	a1 04 0a 00 00       	mov    0xa04,%eax
 58a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 58d:	eb 24                	jmp    5b3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 58f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 592:	8b 00                	mov    (%eax),%eax
 594:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 597:	77 12                	ja     5ab <free+0x35>
 599:	8b 45 f8             	mov    -0x8(%ebp),%eax
 59c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 59f:	77 24                	ja     5c5 <free+0x4f>
 5a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5a4:	8b 00                	mov    (%eax),%eax
 5a6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5a9:	77 1a                	ja     5c5 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ae:	8b 00                	mov    (%eax),%eax
 5b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5b9:	76 d4                	jbe    58f <free+0x19>
 5bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5be:	8b 00                	mov    (%eax),%eax
 5c0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5c3:	76 ca                	jbe    58f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5c8:	8b 40 04             	mov    0x4(%eax),%eax
 5cb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 5d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d5:	01 c2                	add    %eax,%edx
 5d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	39 c2                	cmp    %eax,%edx
 5de:	75 24                	jne    604 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 5e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e3:	8b 50 04             	mov    0x4(%eax),%edx
 5e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e9:	8b 00                	mov    (%eax),%eax
 5eb:	8b 40 04             	mov    0x4(%eax),%eax
 5ee:	01 c2                	add    %eax,%edx
 5f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 5f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f9:	8b 00                	mov    (%eax),%eax
 5fb:	8b 10                	mov    (%eax),%edx
 5fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 600:	89 10                	mov    %edx,(%eax)
 602:	eb 0a                	jmp    60e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 604:	8b 45 fc             	mov    -0x4(%ebp),%eax
 607:	8b 10                	mov    (%eax),%edx
 609:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 60e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 611:	8b 40 04             	mov    0x4(%eax),%eax
 614:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	01 d0                	add    %edx,%eax
 620:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 623:	75 20                	jne    645 <free+0xcf>
    p->s.size += bp->s.size;
 625:	8b 45 fc             	mov    -0x4(%ebp),%eax
 628:	8b 50 04             	mov    0x4(%eax),%edx
 62b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62e:	8b 40 04             	mov    0x4(%eax),%eax
 631:	01 c2                	add    %eax,%edx
 633:	8b 45 fc             	mov    -0x4(%ebp),%eax
 636:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 639:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63c:	8b 10                	mov    (%eax),%edx
 63e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 641:	89 10                	mov    %edx,(%eax)
 643:	eb 08                	jmp    64d <free+0xd7>
  } else
    p->s.ptr = bp;
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 55 f8             	mov    -0x8(%ebp),%edx
 64b:	89 10                	mov    %edx,(%eax)
  freep = p;
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	a3 04 0a 00 00       	mov    %eax,0xa04
}
 655:	c9                   	leave  
 656:	c3                   	ret    

00000657 <morecore>:

static Header*
morecore(uint nu)
{
 657:	55                   	push   %ebp
 658:	89 e5                	mov    %esp,%ebp
 65a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 65d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 664:	77 07                	ja     66d <morecore+0x16>
    nu = 4096;
 666:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	c1 e0 03             	shl    $0x3,%eax
 673:	83 ec 0c             	sub    $0xc,%esp
 676:	50                   	push   %eax
 677:	e8 76 fc ff ff       	call   2f2 <sbrk>
 67c:	83 c4 10             	add    $0x10,%esp
 67f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 682:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 686:	75 07                	jne    68f <morecore+0x38>
    return 0;
 688:	b8 00 00 00 00       	mov    $0x0,%eax
 68d:	eb 26                	jmp    6b5 <morecore+0x5e>
  hp = (Header*)p;
 68f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 692:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 695:	8b 45 f0             	mov    -0x10(%ebp),%eax
 698:	8b 55 08             	mov    0x8(%ebp),%edx
 69b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 69e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a1:	83 c0 08             	add    $0x8,%eax
 6a4:	83 ec 0c             	sub    $0xc,%esp
 6a7:	50                   	push   %eax
 6a8:	e8 c9 fe ff ff       	call   576 <free>
 6ad:	83 c4 10             	add    $0x10,%esp
  return freep;
 6b0:	a1 04 0a 00 00       	mov    0xa04,%eax
}
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <malloc>:

void*
malloc(uint nbytes)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	83 c0 07             	add    $0x7,%eax
 6c3:	c1 e8 03             	shr    $0x3,%eax
 6c6:	40                   	inc    %eax
 6c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 6ca:	a1 04 0a 00 00       	mov    0xa04,%eax
 6cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 6d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6d6:	75 23                	jne    6fb <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 6d8:	c7 45 f0 fc 09 00 00 	movl   $0x9fc,-0x10(%ebp)
 6df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e2:	a3 04 0a 00 00       	mov    %eax,0xa04
 6e7:	a1 04 0a 00 00       	mov    0xa04,%eax
 6ec:	a3 fc 09 00 00       	mov    %eax,0x9fc
    base.s.size = 0;
 6f1:	c7 05 00 0a 00 00 00 	movl   $0x0,0xa00
 6f8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fe:	8b 00                	mov    (%eax),%eax
 700:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 703:	8b 45 f4             	mov    -0xc(%ebp),%eax
 706:	8b 40 04             	mov    0x4(%eax),%eax
 709:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 70c:	72 4d                	jb     75b <malloc+0xa4>
      if(p->s.size == nunits)
 70e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 711:	8b 40 04             	mov    0x4(%eax),%eax
 714:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 717:	75 0c                	jne    725 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	8b 10                	mov    (%eax),%edx
 71e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 721:	89 10                	mov    %edx,(%eax)
 723:	eb 26                	jmp    74b <malloc+0x94>
      else {
        p->s.size -= nunits;
 725:	8b 45 f4             	mov    -0xc(%ebp),%eax
 728:	8b 40 04             	mov    0x4(%eax),%eax
 72b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 72e:	89 c2                	mov    %eax,%edx
 730:	8b 45 f4             	mov    -0xc(%ebp),%eax
 733:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 736:	8b 45 f4             	mov    -0xc(%ebp),%eax
 739:	8b 40 04             	mov    0x4(%eax),%eax
 73c:	c1 e0 03             	shl    $0x3,%eax
 73f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 742:	8b 45 f4             	mov    -0xc(%ebp),%eax
 745:	8b 55 ec             	mov    -0x14(%ebp),%edx
 748:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 74b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74e:	a3 04 0a 00 00       	mov    %eax,0xa04
      return (void*)(p + 1);
 753:	8b 45 f4             	mov    -0xc(%ebp),%eax
 756:	83 c0 08             	add    $0x8,%eax
 759:	eb 3b                	jmp    796 <malloc+0xdf>
    }
    if(p == freep)
 75b:	a1 04 0a 00 00       	mov    0xa04,%eax
 760:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 763:	75 1e                	jne    783 <malloc+0xcc>
      if((p = morecore(nunits)) == 0)
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	ff 75 ec             	pushl  -0x14(%ebp)
 76b:	e8 e7 fe ff ff       	call   657 <morecore>
 770:	83 c4 10             	add    $0x10,%esp
 773:	89 45 f4             	mov    %eax,-0xc(%ebp)
 776:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 77a:	75 07                	jne    783 <malloc+0xcc>
        return 0;
 77c:	b8 00 00 00 00       	mov    $0x0,%eax
 781:	eb 13                	jmp    796 <malloc+0xdf>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 783:	8b 45 f4             	mov    -0xc(%ebp),%eax
 786:	89 45 f0             	mov    %eax,-0x10(%ebp)
 789:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 791:	e9 6d ff ff ff       	jmp    703 <malloc+0x4c>
}
 796:	c9                   	leave  
 797:	c3                   	ret    
