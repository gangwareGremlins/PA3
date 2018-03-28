
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 63                	jmp    85 <wc+0x85>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 52                	jmp    7d <wc+0x7d>
      c++;
  2b:	ff 45 e8             	incl   -0x18(%ebp)
      if(buf[i] == '\n')
  2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  31:	05 00 0c 00 00       	add    $0xc00,%eax
  36:	8a 00                	mov    (%eax),%al
  38:	3c 0a                	cmp    $0xa,%al
  3a:	75 03                	jne    3f <wc+0x3f>
        l++;
  3c:	ff 45 f0             	incl   -0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  42:	05 00 0c 00 00       	add    $0xc00,%eax
  47:	8a 00                	mov    (%eax),%al
  49:	0f be c0             	movsbl %al,%eax
  4c:	83 ec 08             	sub    $0x8,%esp
  4f:	50                   	push   %eax
  50:	68 21 09 00 00       	push   $0x921
  55:	e8 25 02 00 00       	call   27f <strchr>
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	85 c0                	test   %eax,%eax
  5f:	74 09                	je     6a <wc+0x6a>
        inword = 0;
  61:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  68:	eb 10                	jmp    7a <wc+0x7a>
      else if(!inword){
  6a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  6e:	75 0a                	jne    7a <wc+0x7a>
        w++;
  70:	ff 45 ec             	incl   -0x14(%ebp)
        inword = 1;
  73:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7a:	ff 45 f4             	incl   -0xc(%ebp)
  7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  83:	7c a6                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  85:	83 ec 04             	sub    $0x4,%esp
  88:	68 00 02 00 00       	push   $0x200
  8d:	68 00 0c 00 00       	push   $0xc00
  92:	ff 75 08             	pushl  0x8(%ebp)
  95:	e8 71 03 00 00       	call   40b <read>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  a4:	0f 8f 78 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  aa:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ae:	79 17                	jns    c7 <wc+0xc7>
    printf(1, "wc: read error\n");
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	68 27 09 00 00       	push   $0x927
  b8:	6a 01                	push   $0x1
  ba:	e8 b6 04 00 00       	call   575 <printf>
  bf:	83 c4 10             	add    $0x10,%esp
    exit();
  c2:	e8 2c 03 00 00       	call   3f3 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  c7:	83 ec 08             	sub    $0x8,%esp
  ca:	ff 75 0c             	pushl  0xc(%ebp)
  cd:	ff 75 e8             	pushl  -0x18(%ebp)
  d0:	ff 75 ec             	pushl  -0x14(%ebp)
  d3:	ff 75 f0             	pushl  -0x10(%ebp)
  d6:	68 37 09 00 00       	push   $0x937
  db:	6a 01                	push   $0x1
  dd:	e8 93 04 00 00       	call   575 <printf>
  e2:	83 c4 20             	add    $0x20,%esp
}
  e5:	c9                   	leave  
  e6:	c3                   	ret    

000000e7 <main>:

int
main(int argc, char *argv[])
{
  e7:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  eb:	83 e4 f0             	and    $0xfffffff0,%esp
  ee:	ff 71 fc             	pushl  -0x4(%ecx)
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	53                   	push   %ebx
  f5:	51                   	push   %ecx
  f6:	83 ec 10             	sub    $0x10,%esp
  f9:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  fb:	83 3b 01             	cmpl   $0x1,(%ebx)
  fe:	7f 17                	jg     117 <main+0x30>
    wc(0, "");
 100:	83 ec 08             	sub    $0x8,%esp
 103:	68 44 09 00 00       	push   $0x944
 108:	6a 00                	push   $0x0
 10a:	e8 f1 fe ff ff       	call   0 <wc>
 10f:	83 c4 10             	add    $0x10,%esp
    exit();
 112:	e8 dc 02 00 00       	call   3f3 <exit>
  }

  for(i = 1; i < argc; i++){
 117:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 11e:	e9 82 00 00 00       	jmp    1a5 <main+0xbe>
    if((fd = open(argv[i], 0)) < 0){
 123:	8b 45 f4             	mov    -0xc(%ebp),%eax
 126:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 12d:	8b 43 04             	mov    0x4(%ebx),%eax
 130:	01 d0                	add    %edx,%eax
 132:	8b 00                	mov    (%eax),%eax
 134:	83 ec 08             	sub    $0x8,%esp
 137:	6a 00                	push   $0x0
 139:	50                   	push   %eax
 13a:	e8 f4 02 00 00       	call   433 <open>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	89 45 f0             	mov    %eax,-0x10(%ebp)
 145:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 149:	79 29                	jns    174 <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
 14b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 14e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 155:	8b 43 04             	mov    0x4(%ebx),%eax
 158:	01 d0                	add    %edx,%eax
 15a:	8b 00                	mov    (%eax),%eax
 15c:	83 ec 04             	sub    $0x4,%esp
 15f:	50                   	push   %eax
 160:	68 45 09 00 00       	push   $0x945
 165:	6a 01                	push   $0x1
 167:	e8 09 04 00 00       	call   575 <printf>
 16c:	83 c4 10             	add    $0x10,%esp
      exit();
 16f:	e8 7f 02 00 00       	call   3f3 <exit>
    }
    wc(fd, argv[i]);
 174:	8b 45 f4             	mov    -0xc(%ebp),%eax
 177:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 17e:	8b 43 04             	mov    0x4(%ebx),%eax
 181:	01 d0                	add    %edx,%eax
 183:	8b 00                	mov    (%eax),%eax
 185:	83 ec 08             	sub    $0x8,%esp
 188:	50                   	push   %eax
 189:	ff 75 f0             	pushl  -0x10(%ebp)
 18c:	e8 6f fe ff ff       	call   0 <wc>
 191:	83 c4 10             	add    $0x10,%esp
    close(fd);
 194:	83 ec 0c             	sub    $0xc,%esp
 197:	ff 75 f0             	pushl  -0x10(%ebp)
 19a:	e8 7c 02 00 00       	call   41b <close>
 19f:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1a2:	ff 45 f4             	incl   -0xc(%ebp)
 1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a8:	3b 03                	cmp    (%ebx),%eax
 1aa:	0f 8c 73 ff ff ff    	jl     123 <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1b0:	e8 3e 02 00 00       	call   3f3 <exit>

000001b5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	57                   	push   %edi
 1b9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bd:	8b 55 10             	mov    0x10(%ebp),%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	89 cb                	mov    %ecx,%ebx
 1c5:	89 df                	mov    %ebx,%edi
 1c7:	89 d1                	mov    %edx,%ecx
 1c9:	fc                   	cld    
 1ca:	f3 aa                	rep stos %al,%es:(%edi)
 1cc:	89 ca                	mov    %ecx,%edx
 1ce:	89 fb                	mov    %edi,%ebx
 1d0:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d6:	5b                   	pop    %ebx
 1d7:	5f                   	pop    %edi
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    

000001da <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1da:	55                   	push   %ebp
 1db:	89 e5                	mov    %esp,%ebp
 1dd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e6:	90                   	nop
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	8d 50 01             	lea    0x1(%eax),%edx
 1ed:	89 55 08             	mov    %edx,0x8(%ebp)
 1f0:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f3:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f9:	8a 12                	mov    (%edx),%dl
 1fb:	88 10                	mov    %dl,(%eax)
 1fd:	8a 00                	mov    (%eax),%al
 1ff:	84 c0                	test   %al,%al
 201:	75 e4                	jne    1e7 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 06                	jmp    213 <strcmp+0xb>
    p++, q++;
 20d:	ff 45 08             	incl   0x8(%ebp)
 210:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	8a 00                	mov    (%eax),%al
 218:	84 c0                	test   %al,%al
 21a:	74 0e                	je     22a <strcmp+0x22>
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	8a 10                	mov    (%eax),%dl
 221:	8b 45 0c             	mov    0xc(%ebp),%eax
 224:	8a 00                	mov    (%eax),%al
 226:	38 c2                	cmp    %al,%dl
 228:	74 e3                	je     20d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	8a 00                	mov    (%eax),%al
 22f:	0f b6 d0             	movzbl %al,%edx
 232:	8b 45 0c             	mov    0xc(%ebp),%eax
 235:	8a 00                	mov    (%eax),%al
 237:	0f b6 c0             	movzbl %al,%eax
 23a:	29 c2                	sub    %eax,%edx
 23c:	89 d0                	mov    %edx,%eax
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <strlen>:

uint
strlen(char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 246:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 24d:	eb 03                	jmp    252 <strlen+0x12>
 24f:	ff 45 fc             	incl   -0x4(%ebp)
 252:	8b 55 fc             	mov    -0x4(%ebp),%edx
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	01 d0                	add    %edx,%eax
 25a:	8a 00                	mov    (%eax),%al
 25c:	84 c0                	test   %al,%al
 25e:	75 ef                	jne    24f <strlen+0xf>
    ;
  return n;
 260:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <memset>:

void*
memset(void *dst, int c, uint n)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 268:	8b 45 10             	mov    0x10(%ebp),%eax
 26b:	50                   	push   %eax
 26c:	ff 75 0c             	pushl  0xc(%ebp)
 26f:	ff 75 08             	pushl  0x8(%ebp)
 272:	e8 3e ff ff ff       	call   1b5 <stosb>
 277:	83 c4 0c             	add    $0xc,%esp
  return dst;
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 27d:	c9                   	leave  
 27e:	c3                   	ret    

0000027f <strchr>:

char*
strchr(const char *s, char c)
{
 27f:	55                   	push   %ebp
 280:	89 e5                	mov    %esp,%ebp
 282:	83 ec 04             	sub    $0x4,%esp
 285:	8b 45 0c             	mov    0xc(%ebp),%eax
 288:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 28b:	eb 12                	jmp    29f <strchr+0x20>
    if(*s == c)
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	8a 00                	mov    (%eax),%al
 292:	3a 45 fc             	cmp    -0x4(%ebp),%al
 295:	75 05                	jne    29c <strchr+0x1d>
      return (char*)s;
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	eb 11                	jmp    2ad <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 29c:	ff 45 08             	incl   0x8(%ebp)
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	8a 00                	mov    (%eax),%al
 2a4:	84 c0                	test   %al,%al
 2a6:	75 e5                	jne    28d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ad:	c9                   	leave  
 2ae:	c3                   	ret    

000002af <gets>:

char*
gets(char *buf, int max)
{
 2af:	55                   	push   %ebp
 2b0:	89 e5                	mov    %esp,%ebp
 2b2:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2bc:	eb 41                	jmp    2ff <gets+0x50>
    cc = read(0, &c, 1);
 2be:	83 ec 04             	sub    $0x4,%esp
 2c1:	6a 01                	push   $0x1
 2c3:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2c6:	50                   	push   %eax
 2c7:	6a 00                	push   $0x0
 2c9:	e8 3d 01 00 00       	call   40b <read>
 2ce:	83 c4 10             	add    $0x10,%esp
 2d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2d8:	7f 02                	jg     2dc <gets+0x2d>
      break;
 2da:	eb 2c                	jmp    308 <gets+0x59>
    buf[i++] = c;
 2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2df:	8d 50 01             	lea    0x1(%eax),%edx
 2e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2e5:	89 c2                	mov    %eax,%edx
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	01 c2                	add    %eax,%edx
 2ec:	8a 45 ef             	mov    -0x11(%ebp),%al
 2ef:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2f1:	8a 45 ef             	mov    -0x11(%ebp),%al
 2f4:	3c 0a                	cmp    $0xa,%al
 2f6:	74 10                	je     308 <gets+0x59>
 2f8:	8a 45 ef             	mov    -0x11(%ebp),%al
 2fb:	3c 0d                	cmp    $0xd,%al
 2fd:	74 09                	je     308 <gets+0x59>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 302:	40                   	inc    %eax
 303:	3b 45 0c             	cmp    0xc(%ebp),%eax
 306:	7c b6                	jl     2be <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 308:	8b 55 f4             	mov    -0xc(%ebp),%edx
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	01 d0                	add    %edx,%eax
 310:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 313:	8b 45 08             	mov    0x8(%ebp),%eax
}
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <stat>:

int
stat(char *n, struct stat *st)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 31e:	83 ec 08             	sub    $0x8,%esp
 321:	6a 00                	push   $0x0
 323:	ff 75 08             	pushl  0x8(%ebp)
 326:	e8 08 01 00 00       	call   433 <open>
 32b:	83 c4 10             	add    $0x10,%esp
 32e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 331:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 335:	79 07                	jns    33e <stat+0x26>
    return -1;
 337:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 33c:	eb 25                	jmp    363 <stat+0x4b>
  r = fstat(fd, st);
 33e:	83 ec 08             	sub    $0x8,%esp
 341:	ff 75 0c             	pushl  0xc(%ebp)
 344:	ff 75 f4             	pushl  -0xc(%ebp)
 347:	e8 ff 00 00 00       	call   44b <fstat>
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 352:	83 ec 0c             	sub    $0xc,%esp
 355:	ff 75 f4             	pushl  -0xc(%ebp)
 358:	e8 be 00 00 00       	call   41b <close>
 35d:	83 c4 10             	add    $0x10,%esp
  return r;
 360:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 363:	c9                   	leave  
 364:	c3                   	ret    

00000365 <atoi>:

int
atoi(const char *s)
{
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 36b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 372:	eb 24                	jmp    398 <atoi+0x33>
    n = n*10 + *s++ - '0';
 374:	8b 55 fc             	mov    -0x4(%ebp),%edx
 377:	89 d0                	mov    %edx,%eax
 379:	c1 e0 02             	shl    $0x2,%eax
 37c:	01 d0                	add    %edx,%eax
 37e:	01 c0                	add    %eax,%eax
 380:	89 c1                	mov    %eax,%ecx
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	8d 50 01             	lea    0x1(%eax),%edx
 388:	89 55 08             	mov    %edx,0x8(%ebp)
 38b:	8a 00                	mov    (%eax),%al
 38d:	0f be c0             	movsbl %al,%eax
 390:	01 c8                	add    %ecx,%eax
 392:	83 e8 30             	sub    $0x30,%eax
 395:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	8a 00                	mov    (%eax),%al
 39d:	3c 2f                	cmp    $0x2f,%al
 39f:	7e 09                	jle    3aa <atoi+0x45>
 3a1:	8b 45 08             	mov    0x8(%ebp),%eax
 3a4:	8a 00                	mov    (%eax),%al
 3a6:	3c 39                	cmp    $0x39,%al
 3a8:	7e ca                	jle    374 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3be:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3c1:	eb 16                	jmp    3d9 <memmove+0x2a>
    *dst++ = *src++;
 3c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3c6:	8d 50 01             	lea    0x1(%eax),%edx
 3c9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3cc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3cf:	8d 4a 01             	lea    0x1(%edx),%ecx
 3d2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3d5:	8a 12                	mov    (%edx),%dl
 3d7:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d9:	8b 45 10             	mov    0x10(%ebp),%eax
 3dc:	8d 50 ff             	lea    -0x1(%eax),%edx
 3df:	89 55 10             	mov    %edx,0x10(%ebp)
 3e2:	85 c0                	test   %eax,%eax
 3e4:	7f dd                	jg     3c3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3e6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3e9:	c9                   	leave  
 3ea:	c3                   	ret    

000003eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3eb:	b8 01 00 00 00       	mov    $0x1,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <exit>:
SYSCALL(exit)
 3f3:	b8 02 00 00 00       	mov    $0x2,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <wait>:
SYSCALL(wait)
 3fb:	b8 03 00 00 00       	mov    $0x3,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <pipe>:
SYSCALL(pipe)
 403:	b8 04 00 00 00       	mov    $0x4,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <read>:
SYSCALL(read)
 40b:	b8 05 00 00 00       	mov    $0x5,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <write>:
SYSCALL(write)
 413:	b8 10 00 00 00       	mov    $0x10,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <close>:
SYSCALL(close)
 41b:	b8 15 00 00 00       	mov    $0x15,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <kill>:
SYSCALL(kill)
 423:	b8 06 00 00 00       	mov    $0x6,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <exec>:
SYSCALL(exec)
 42b:	b8 07 00 00 00       	mov    $0x7,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <open>:
SYSCALL(open)
 433:	b8 0f 00 00 00       	mov    $0xf,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mknod>:
SYSCALL(mknod)
 43b:	b8 11 00 00 00       	mov    $0x11,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <unlink>:
SYSCALL(unlink)
 443:	b8 12 00 00 00       	mov    $0x12,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <fstat>:
SYSCALL(fstat)
 44b:	b8 08 00 00 00       	mov    $0x8,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <link>:
SYSCALL(link)
 453:	b8 13 00 00 00       	mov    $0x13,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mkdir>:
SYSCALL(mkdir)
 45b:	b8 14 00 00 00       	mov    $0x14,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <chdir>:
SYSCALL(chdir)
 463:	b8 09 00 00 00       	mov    $0x9,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <dup>:
SYSCALL(dup)
 46b:	b8 0a 00 00 00       	mov    $0xa,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <getpid>:
SYSCALL(getpid)
 473:	b8 0b 00 00 00       	mov    $0xb,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <sbrk>:
SYSCALL(sbrk)
 47b:	b8 0c 00 00 00       	mov    $0xc,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <sleep>:
SYSCALL(sleep)
 483:	b8 0d 00 00 00       	mov    $0xd,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <uptime>:
SYSCALL(uptime)
 48b:	b8 0e 00 00 00       	mov    $0xe,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getCallCount>:
SYSCALL(getCallCount)
 493:	b8 16 00 00 00       	mov    $0x16,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <myMemory>:
SYSCALL(myMemory)
 49b:	b8 17 00 00 00       	mov    $0x17,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	83 ec 18             	sub    $0x18,%esp
 4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ac:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4af:	83 ec 04             	sub    $0x4,%esp
 4b2:	6a 01                	push   $0x1
 4b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b7:	50                   	push   %eax
 4b8:	ff 75 08             	pushl  0x8(%ebp)
 4bb:	e8 53 ff ff ff       	call   413 <write>
 4c0:	83 c4 10             	add    $0x10,%esp
}
 4c3:	c9                   	leave  
 4c4:	c3                   	ret    

000004c5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c5:	55                   	push   %ebp
 4c6:	89 e5                	mov    %esp,%ebp
 4c8:	53                   	push   %ebx
 4c9:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d7:	74 17                	je     4f0 <printint+0x2b>
 4d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4dd:	79 11                	jns    4f0 <printint+0x2b>
    neg = 1;
 4df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e9:	f7 d8                	neg    %eax
 4eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ee:	eb 06                	jmp    4f6 <printint+0x31>
  } else {
    x = xx;
 4f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4fd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 500:	8d 41 01             	lea    0x1(%ecx),%eax
 503:	89 45 f4             	mov    %eax,-0xc(%ebp)
 506:	8b 5d 10             	mov    0x10(%ebp),%ebx
 509:	8b 45 ec             	mov    -0x14(%ebp),%eax
 50c:	ba 00 00 00 00       	mov    $0x0,%edx
 511:	f7 f3                	div    %ebx
 513:	89 d0                	mov    %edx,%eax
 515:	8a 80 cc 0b 00 00    	mov    0xbcc(%eax),%al
 51b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 522:	8b 45 ec             	mov    -0x14(%ebp),%eax
 525:	ba 00 00 00 00       	mov    $0x0,%edx
 52a:	f7 f3                	div    %ebx
 52c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 533:	75 c8                	jne    4fd <printint+0x38>
  if(neg)
 535:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 539:	74 0e                	je     549 <printint+0x84>
    buf[i++] = '-';
 53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53e:	8d 50 01             	lea    0x1(%eax),%edx
 541:	89 55 f4             	mov    %edx,-0xc(%ebp)
 544:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 549:	eb 1c                	jmp    567 <printint+0xa2>
    putc(fd, buf[i]);
 54b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	01 d0                	add    %edx,%eax
 553:	8a 00                	mov    (%eax),%al
 555:	0f be c0             	movsbl %al,%eax
 558:	83 ec 08             	sub    $0x8,%esp
 55b:	50                   	push   %eax
 55c:	ff 75 08             	pushl  0x8(%ebp)
 55f:	e8 3f ff ff ff       	call   4a3 <putc>
 564:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 567:	ff 4d f4             	decl   -0xc(%ebp)
 56a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56e:	79 db                	jns    54b <printint+0x86>
    putc(fd, buf[i]);
}
 570:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 573:	c9                   	leave  
 574:	c3                   	ret    

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 582:	8d 45 0c             	lea    0xc(%ebp),%eax
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 592:	e9 54 01 00 00       	jmp    6eb <printf+0x176>
    c = fmt[i] & 0xff;
 597:	8b 55 0c             	mov    0xc(%ebp),%edx
 59a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59d:	01 d0                	add    %edx,%eax
 59f:	8a 00                	mov    (%eax),%al
 5a1:	0f be c0             	movsbl %al,%eax
 5a4:	25 ff 00 00 00       	and    $0xff,%eax
 5a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b0:	75 2c                	jne    5de <printf+0x69>
      if(c == '%'){
 5b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b6:	75 0c                	jne    5c4 <printf+0x4f>
        state = '%';
 5b8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5bf:	e9 24 01 00 00       	jmp    6e8 <printf+0x173>
      } else {
        putc(fd, c);
 5c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c7:	0f be c0             	movsbl %al,%eax
 5ca:	83 ec 08             	sub    $0x8,%esp
 5cd:	50                   	push   %eax
 5ce:	ff 75 08             	pushl  0x8(%ebp)
 5d1:	e8 cd fe ff ff       	call   4a3 <putc>
 5d6:	83 c4 10             	add    $0x10,%esp
 5d9:	e9 0a 01 00 00       	jmp    6e8 <printf+0x173>
      }
    } else if(state == '%'){
 5de:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e2:	0f 85 00 01 00 00    	jne    6e8 <printf+0x173>
      if(c == 'd'){
 5e8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5ec:	75 1e                	jne    60c <printf+0x97>
        printint(fd, *ap, 10, 1);
 5ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f1:	8b 00                	mov    (%eax),%eax
 5f3:	6a 01                	push   $0x1
 5f5:	6a 0a                	push   $0xa
 5f7:	50                   	push   %eax
 5f8:	ff 75 08             	pushl  0x8(%ebp)
 5fb:	e8 c5 fe ff ff       	call   4c5 <printint>
 600:	83 c4 10             	add    $0x10,%esp
        ap++;
 603:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 607:	e9 d5 00 00 00       	jmp    6e1 <printf+0x16c>
      } else if(c == 'x' || c == 'p'){
 60c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 610:	74 06                	je     618 <printf+0xa3>
 612:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 616:	75 1e                	jne    636 <printf+0xc1>
        printint(fd, *ap, 16, 0);
 618:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61b:	8b 00                	mov    (%eax),%eax
 61d:	6a 00                	push   $0x0
 61f:	6a 10                	push   $0x10
 621:	50                   	push   %eax
 622:	ff 75 08             	pushl  0x8(%ebp)
 625:	e8 9b fe ff ff       	call   4c5 <printint>
 62a:	83 c4 10             	add    $0x10,%esp
        ap++;
 62d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 631:	e9 ab 00 00 00       	jmp    6e1 <printf+0x16c>
      } else if(c == 's'){
 636:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 63a:	75 40                	jne    67c <printf+0x107>
        s = (char*)*ap;
 63c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63f:	8b 00                	mov    (%eax),%eax
 641:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 644:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 648:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 64c:	75 07                	jne    655 <printf+0xe0>
          s = "(null)";
 64e:	c7 45 f4 59 09 00 00 	movl   $0x959,-0xc(%ebp)
        while(*s != 0){
 655:	eb 1a                	jmp    671 <printf+0xfc>
          putc(fd, *s);
 657:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65a:	8a 00                	mov    (%eax),%al
 65c:	0f be c0             	movsbl %al,%eax
 65f:	83 ec 08             	sub    $0x8,%esp
 662:	50                   	push   %eax
 663:	ff 75 08             	pushl  0x8(%ebp)
 666:	e8 38 fe ff ff       	call   4a3 <putc>
 66b:	83 c4 10             	add    $0x10,%esp
          s++;
 66e:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 671:	8b 45 f4             	mov    -0xc(%ebp),%eax
 674:	8a 00                	mov    (%eax),%al
 676:	84 c0                	test   %al,%al
 678:	75 dd                	jne    657 <printf+0xe2>
 67a:	eb 65                	jmp    6e1 <printf+0x16c>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 680:	75 1d                	jne    69f <printf+0x12a>
        putc(fd, *ap);
 682:	8b 45 e8             	mov    -0x18(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	0f be c0             	movsbl %al,%eax
 68a:	83 ec 08             	sub    $0x8,%esp
 68d:	50                   	push   %eax
 68e:	ff 75 08             	pushl  0x8(%ebp)
 691:	e8 0d fe ff ff       	call   4a3 <putc>
 696:	83 c4 10             	add    $0x10,%esp
        ap++;
 699:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69d:	eb 42                	jmp    6e1 <printf+0x16c>
      } else if(c == '%'){
 69f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6a3:	75 17                	jne    6bc <printf+0x147>
        putc(fd, c);
 6a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a8:	0f be c0             	movsbl %al,%eax
 6ab:	83 ec 08             	sub    $0x8,%esp
 6ae:	50                   	push   %eax
 6af:	ff 75 08             	pushl  0x8(%ebp)
 6b2:	e8 ec fd ff ff       	call   4a3 <putc>
 6b7:	83 c4 10             	add    $0x10,%esp
 6ba:	eb 25                	jmp    6e1 <printf+0x16c>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6bc:	83 ec 08             	sub    $0x8,%esp
 6bf:	6a 25                	push   $0x25
 6c1:	ff 75 08             	pushl  0x8(%ebp)
 6c4:	e8 da fd ff ff       	call   4a3 <putc>
 6c9:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 6cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cf:	0f be c0             	movsbl %al,%eax
 6d2:	83 ec 08             	sub    $0x8,%esp
 6d5:	50                   	push   %eax
 6d6:	ff 75 08             	pushl  0x8(%ebp)
 6d9:	e8 c5 fd ff ff       	call   4a3 <putc>
 6de:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6e8:	ff 45 f0             	incl   -0x10(%ebp)
 6eb:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f1:	01 d0                	add    %edx,%eax
 6f3:	8a 00                	mov    (%eax),%al
 6f5:	84 c0                	test   %al,%al
 6f7:	0f 85 9a fe ff ff    	jne    597 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    

000006ff <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	83 e8 08             	sub    $0x8,%eax
 70b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70e:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 713:	89 45 fc             	mov    %eax,-0x4(%ebp)
 716:	eb 24                	jmp    73c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 720:	77 12                	ja     734 <free+0x35>
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 728:	77 24                	ja     74e <free+0x4f>
 72a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72d:	8b 00                	mov    (%eax),%eax
 72f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 732:	77 1a                	ja     74e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 734:	8b 45 fc             	mov    -0x4(%ebp),%eax
 737:	8b 00                	mov    (%eax),%eax
 739:	89 45 fc             	mov    %eax,-0x4(%ebp)
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 742:	76 d4                	jbe    718 <free+0x19>
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 74c:	76 ca                	jbe    718 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	8b 40 04             	mov    0x4(%eax),%eax
 754:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	01 c2                	add    %eax,%edx
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	39 c2                	cmp    %eax,%edx
 767:	75 24                	jne    78d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	8b 50 04             	mov    0x4(%eax),%edx
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	01 c2                	add    %eax,%edx
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	8b 00                	mov    (%eax),%eax
 784:	8b 10                	mov    (%eax),%edx
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	89 10                	mov    %edx,(%eax)
 78b:	eb 0a                	jmp    797 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 10                	mov    (%eax),%edx
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	8b 40 04             	mov    0x4(%eax),%eax
 79d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a7:	01 d0                	add    %edx,%eax
 7a9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ac:	75 20                	jne    7ce <free+0xcf>
    p->s.size += bp->s.size;
 7ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b1:	8b 50 04             	mov    0x4(%eax),%edx
 7b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b7:	8b 40 04             	mov    0x4(%eax),%eax
 7ba:	01 c2                	add    %eax,%edx
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	8b 10                	mov    (%eax),%edx
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	89 10                	mov    %edx,(%eax)
 7cc:	eb 08                	jmp    7d6 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7d4:	89 10                	mov    %edx,(%eax)
  freep = p;
 7d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d9:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 7de:	c9                   	leave  
 7df:	c3                   	ret    

000007e0 <morecore>:

static Header*
morecore(uint nu)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7e6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7ed:	77 07                	ja     7f6 <morecore+0x16>
    nu = 4096;
 7ef:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	c1 e0 03             	shl    $0x3,%eax
 7fc:	83 ec 0c             	sub    $0xc,%esp
 7ff:	50                   	push   %eax
 800:	e8 76 fc ff ff       	call   47b <sbrk>
 805:	83 c4 10             	add    $0x10,%esp
 808:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 80b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 80f:	75 07                	jne    818 <morecore+0x38>
    return 0;
 811:	b8 00 00 00 00       	mov    $0x0,%eax
 816:	eb 26                	jmp    83e <morecore+0x5e>
  hp = (Header*)p;
 818:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 81e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 821:	8b 55 08             	mov    0x8(%ebp),%edx
 824:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 827:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82a:	83 c0 08             	add    $0x8,%eax
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	50                   	push   %eax
 831:	e8 c9 fe ff ff       	call   6ff <free>
 836:	83 c4 10             	add    $0x10,%esp
  return freep;
 839:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 83e:	c9                   	leave  
 83f:	c3                   	ret    

00000840 <malloc>:

void*
malloc(uint nbytes)
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	83 c0 07             	add    $0x7,%eax
 84c:	c1 e8 03             	shr    $0x3,%eax
 84f:	40                   	inc    %eax
 850:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 853:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 858:	89 45 f0             	mov    %eax,-0x10(%ebp)
 85b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 85f:	75 23                	jne    884 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 861:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 868:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86b:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 870:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 875:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 87a:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 881:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 884:	8b 45 f0             	mov    -0x10(%ebp),%eax
 887:	8b 00                	mov    (%eax),%eax
 889:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	8b 40 04             	mov    0x4(%eax),%eax
 892:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 895:	72 4d                	jb     8e4 <malloc+0xa4>
      if(p->s.size == nunits)
 897:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89a:	8b 40 04             	mov    0x4(%eax),%eax
 89d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8a0:	75 0c                	jne    8ae <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 8a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a5:	8b 10                	mov    (%eax),%edx
 8a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8aa:	89 10                	mov    %edx,(%eax)
 8ac:	eb 26                	jmp    8d4 <malloc+0x94>
      else {
        p->s.size -= nunits;
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	8b 40 04             	mov    0x4(%eax),%eax
 8b4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8b7:	89 c2                	mov    %eax,%edx
 8b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c2:	8b 40 04             	mov    0x4(%eax),%eax
 8c5:	c1 e0 03             	shl    $0x3,%eax
 8c8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8d1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d7:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	83 c0 08             	add    $0x8,%eax
 8e2:	eb 3b                	jmp    91f <malloc+0xdf>
    }
    if(p == freep)
 8e4:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 8e9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8ec:	75 1e                	jne    90c <malloc+0xcc>
      if((p = morecore(nunits)) == 0)
 8ee:	83 ec 0c             	sub    $0xc,%esp
 8f1:	ff 75 ec             	pushl  -0x14(%ebp)
 8f4:	e8 e7 fe ff ff       	call   7e0 <morecore>
 8f9:	83 c4 10             	add    $0x10,%esp
 8fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 903:	75 07                	jne    90c <malloc+0xcc>
        return 0;
 905:	b8 00 00 00 00       	mov    $0x0,%eax
 90a:	eb 13                	jmp    91f <malloc+0xdf>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 912:	8b 45 f4             	mov    -0xc(%ebp),%eax
 915:	8b 00                	mov    (%eax),%eax
 917:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 91a:	e9 6d ff ff ff       	jmp    88c <malloc+0x4c>
}
 91f:	c9                   	leave  
 920:	c3                   	ret    
