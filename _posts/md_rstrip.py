#encoding=utf8
import re, os, sys
sys.path.append("../../")
from pythonx.funclib import *

OPENFILE = "openfile" in sys.argv
AUTOFORMAT = "format" in sys.argv

def getLeftSpaceCount(line):
    line = line[:]
    assert not line.startswith("\t"), line
    count = 0
    while line and line[0] == ' ':
        line = line[1:]
        count += 1
    return count

g_cnchar = []
g_enchar = []
g_xychar = []
def mainfile(fpath, fname, ftype):
    ftype = ftype.lower()
    if not ftype in ("md", "py", "php", "html", "htm",):
        return

    ismdfile = ftype in ("md",)
    ispyfile = ftype in ("py",)
    ishtmfile = ftype in ("html", "htm",)

    if fpath.find("\\backup\\") != -1:
        return
    if fpath.find("\\d2l-zh\\") != -1:
        return
    if fpath.find("\\_site\\") != -1:
        return

    print(fpath)
    lines = readfileLines(fpath, False, False, "utf8")
    lines = [line.rstrip() for line in lines]

    codestate = False
    for index, line in enumerate(lines):
        count = getLeftSpaceCount(line)
        preline = lines[index - 1] if index > 0 else ""
        nextline = lines[index + 1] if index < len(lines)-1 else ""

        tagregex = "^\\s*[#]+ "
        prelinetag = re.findall(tagregex, preline)
        nextlinetag = re.findall(tagregex, nextline)

        if re.findall("^\\s*[*-]+ ", line):
            idtcnt = 2
        else:
            idtcnt = 4

        cnsign =  "·×öδεπ—’“”…→∞、。《》【】（），：；？！"
        cnregex = "\u4e00-\u9fa5" + cnsign
        ensign =  r"""!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"""

        if line.find("\xa0") != -1:
            print("xspace", fpath, line)

        liw = re.findall("[{}]+".format(cnregex,), line, re.IGNORECASE)
        g_cnchar.extend(liw)
        lia = re.findall("[^{}]+".format(cnregex,), line, re.IGNORECASE)
        g_enchar.extend(lia)

        lix1 = re.findall("[{}][^{} *]".format(cnregex, cnregex), line, re.IGNORECASE)
        lix2 = re.findall("[^{} *][{}]".format(cnregex, cnregex), line, re.IGNORECASE)
        lix = []
        lix.extend(lix1)
        lix.extend(lix2)

        for ix in lix:
            cx, cy = ix
            if cy in cnsign or cx in cnsign:
                continue
            if cy in "-<]" or cx in "->[":
                continue

            if cx in ('"', "[") and (" "+line).count(" "+ix) == 1:
                continue
            if cy in ('"', "]", ",") and (line+" ").count(ix+" ") == 1:
                continue
            if cx in ('"',) and ("["+line).count("["+ix) == 1:
                continue
            if cy in ('"',) and (line+"]").count(ix+"]") == 1:
                continue

            if ishtmfile:
                continue

            g_xychar.append(ix)
            print("[%d]"%(index+1), ix, "\t", line)
            if AUTOFORMAT:
                line = line.replace(ix, cx+" "+cy)
                lines[index] = line

        fxline = "".join(line.split())
        if fxline.startswith("{%highlight"):
            codestate = True
        if fxline.startswith("{%endhighlight%}"):
            codestate = False
            continue

        if codestate:
            continue

        if ismdfile and (prelinetag or nextlinetag):
            if line:
                openTextFile(fpath)
                assert False, "{}:{} {}".format(fpath, index+1, line)

        if count > 12 or count % idtcnt == 0:
            pass # ok
        elif not ishtmfile:
            openTextFile(fpath)
            assert False, "{}:{} {}".format(fpath, index+1, line)

    page = "\r\n".join(lines)
    while page.find("\r\n" * 3) != -1:
        page = page.replace("\r\n" * 3, "\r\n" * 2)

    if not ispyfile:
        page = page.replace("\r\n"*2+"### ", "\r\n"*3+"### ")
        page = page.replace("\r\n"*2+"## ",  "\r\n"*3+"## ")
        page = page.replace("\r\n"*2+"# ",   "\r\n"*3+"# ")

    writefile(fpath, page.encode("utf8"))

def viewchar(lichar, xfile, xmin, xmax):
    li = list(set("".join(lichar)))
    li.sort()
    page = ""
    minv, maxv = 1024, 0
    for index, cnchar in enumerate(li):
        page += cnchar
        minv = min(minv, ord(cnchar))
        maxv = max(maxv, ord(cnchar))
        if (index + 1) % 50 == 0:
            page += "\r\n"
    tempfile = os.path.join("tempdir", xfile)
    writefile(tempfile, page.encode("utf8"))

    if OPENFILE:
        openTextFile(tempfile)
    print(minv, maxv)
    print([(ord(k), k) for k in li[:5]])
    print([(ord(k), k) for k in li[-5:]])
    assert xmin <= minv and maxv <= xmax

def main():
    print(parsePythonCmdx(__file__, retmap=True))
    searchdir("..", mainfile)

    viewchar(g_cnchar, "cnfile.txt", 0x80, 0x7FFFFFFF)
    viewchar(g_enchar, "enfile.txt", 0x0,  0x7F)

if __name__ == "__main__":
    main()
