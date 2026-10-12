10 rem 
20 bload "j2v.bin":defusr=&hd000
30 rem
40 goto 100
50 b$=usr(a$):return
60 rem
100 a$=chr$(12)+chr$(24)+chr$(0)+"40 character text"+chr$(13)+chr$(10):gosub 50
110 a$=chr$(24)+chr$(1)+"80 character text"+chr$(13)+chr$(10):gosub 50
120 a$=chr$(24)+chr$(2)+"40 character bold text"+chr$(13)+chr$(10):gosub 50
130 a$=chr$(24)+chr$(3)+"80 character bold text"+chr$(13)+chr$(10):gosub 50
140 a$=chr$(24)+chr$(4)+"40 character double height text"+chr$(13)+chr$(10):gosub 50
150 a$=chr$(24)+chr$(5)+"80 character double height text"+chr$(13)+chr$(10):gosub 50
160 a$=chr$(24)+chr$(6)+"40 character double height bold text"+chr$(13)+chr$(10):gosub 50
170 a$=chr$(24)+chr$(7)+"80 character double height bold text"+chr$(13)+chr$(10):gosub 50
180 rem
185 FOR A=1TO500:NEXT A
190 A$=CHR$(13)+CHR$(10)+CHR$(13)+CHR$(10):GOSUB 50
200 A$=CHR$(24)+CHR$(6)+"It's alive":GOSUB 50
210 FOR A=1TO300:NEXT A
220 A$=", it's alive !"+CHR$(13)+CHR$(10):GOSUB 50
