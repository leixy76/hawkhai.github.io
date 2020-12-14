#encoding=utf8
import re, os, sys
sys.path.append("../")
from pythonx.funclib import *
from pythonx.coderstrip import *

OPENFILE = "openfile" in sys.argv
AUTOFORMAT = "format" in sys.argv
REBUILD = "rebuild" in sys.argv
COPYRES = "copyres" in sys.argv

linktagli = (("{% include relref_bili.html %}]",    "bilibili]", "bilibili", "bilibili.com"),
             ("{% include relref_zhihu.html %}]",   "zhihu]",    "zhihu",    "zhihu.com"),
             ("{% include relref_cnblogs.html %}]", "cnblogs]",  "cnblogs",  "cnblogs.com"),
             ("{% include relref_csdn.html %}]",    "csdn]",     "csdn",     "csdn.net"),
            )

mdkeylist = """
categories
tags
location
comments
toclistyle
layout
visibility
mermaid
title
mathjax
glslcanvas
permalink
toc""".split()

g_snapcache = {}
g_untouched = {}
def buildSnapCache(rootdir):
    rootdir = os.path.normpath(rootdir)
    def mainfile(fpath, fname, ftype):
        fpath = os.path.normpath(fpath)
        if not re.findall("^[0-9a-f]{8}\\.", fname):
            return
        key = fname[:8]
        g_snapcache[key] = fpath
        g_untouched[key] = fpath
    searchdir(rootdir, mainfile)

def touchSnapCache(umd5, slocal):
    if umd5 in g_untouched.keys() and slocal == g_untouched[umd5]:
        del g_untouched[umd5]

def getSnapCache(umd5):
    if umd5 in g_snapcache.keys():
        return readfile(g_snapcache[umd5])
    return None

def clearSnapCache():
    print("ClearSnapCache", len(g_untouched))
    for umd5 in g_untouched.keys():
        osremove(g_untouched[umd5])

def backupUrlContent(fpath, url):
    for file in ("/qt-creator-opensource-windows-x86-4.13.2.exe",
                 "/qt-opensource-windows-x86-5.14.1.exe",
                 "/qt-opensource-windows-x86-5.14.2.exe",
                 "/d2l-zh.zip",
                 "/mingw-get-setup.exe",
                ):
        if url.endswith(file):
            return
    assert not url.endswith(".exe"), url
    assert not url.endswith(".zip"), url
    # 有可能挂掉的网站，都稍微做一下备份。
    for host in ("https://pypi.tuna.tsinghua.edu.cn/",
                 "https://www.tapd.cn/",
                 "https://ml00cz5fm4.feishu.cn/",
                 "https://gitlab.liebaopay.com/",
                 "http://tcbuglist.rdev.kingsoft.net/",
                 "https://blog.hawkhai.com/",
                 "https://sunocean.life/",
                 "https://github.com/hawkhai/hawkhai.github.io/",
                ):
        if url.startswith(host):
            return

    print(fpath, url)
    chrome = False
    for host in (#"https://www.jianshu.com/",
                 #"https://www.bilibili.com/",
                 #"https://learnopengl-cn.readthedocs.io/",
                ):
        if url.startswith(host):
            chrome = True
    mdname = os.path.split(fpath)[-1]
    uhost = url.split("//")[1].split("/")[0]
    umd5 = getmd5(url)
    ttype = ".html"
    local = os.path.join("backup", mdname, uhost, umd5 + ttype)
    ttype = calcType(ttype, url.split(uhost)[-1])
    slocal = os.path.join("backup", mdname, uhost, umd5[:8] + ttype)
    if os.path.exists(local):
        os.rename(local, slocal)

    fdata = getSnapCache(umd5[:8])
    if fdata:
        writefile(slocal, fdata)
    else:
        fdata = netgetCacheLocal(url, timeout=60*60*24*1000, chrome=chrome, local=slocal)

    if url not in ("http://www.robots.ox.ac.uk/~az/lectures/ia/lect2.pdf",
                   "http://mstrzel.eletel.p.lodz.pl/mstrzel/pattern_rec/fft_ang.pdf",):
        assert len(fdata) <= 1024*1024*2, len(fdata)
    remote = "{}/{}/{}/{}".format("backup", mdname, uhost, umd5[:8] + ttype)
    touchSnapCache(umd5[:8], slocal)

    if not slocal.split(".")[-1] in ("pdf", "html", "git", "php", "c", "phtml", "cpp", "htm", "shtm",
                                     "ipynb", "py", "asp",):
        print(fpath, url)
        assert False, slocal
    return remote

g_orgremove = set()
def organizeClear():
    for key in g_orgremove:
        osremove(key)

def organizeRes(ik, fpath, line):
    if not COPYRES:
        assert os.path.exists(ik), fpath
        return line
    invisible = os.path.abspath(fpath).startswith(os.path.abspath("invisible")+"\\")
    fname = os.path.split(fpath)[-1]
    if fname.lower().endswith(".md"):
        fname = fname[:-3]
    if re.findall("^[0-9]{4}-[0-9]{2}-[0-9]{2}-", fname):
        fname = fname[:10].replace("-", "")[-6:]+"-"+fname[11:]
    if len(fname) > 32:
        fname = fname[:30]+"~"+getmd5(fname)[:2]
    ikdir, ikfile = os.path.split(ik)
    if ikfile.find(".") == -1:
        ikfile = ikfile + ".jpg"
    tpath = os.path.join("assets", "images", fname, ikfile).lower()
    if invisible:
        tpath = os.path.join("invisible", "images", fname, ikfile).lower()
    if os.path.exists(ik):
        copyfile(ik, tpath)
        if os.path.abspath(ik) != os.path.abspath(tpath):
            g_orgremove.add(ik)
    else:
        assert False, ik

    if not ikfile.split(".")[-1] in ("pdf", "png", "jpg", "gif", "jpeg", "webp",):
        print(ik, fpath, line)
        assert False, ik
    return line.replace(ik, tpath.replace("\\", "/"))

g_hostset = {}
def collectHost(fpath, line):

    reflist = []

    linesrc = line[:]
    xline = line[:]
    for tak, src, name, host in linktagli:
        xline = xline.replace(tak, src)
    #li = re.findall("<.*?>", xline)
    #for tx in li:
    #    line = line.replace(tx, "")

    regex = "(?:\"/(.*?)\")|(?:'/(.*?)')"
    li = re.findall(regex, line)
    for ik in li:
        ik = "".join(ik)
        if ik.endswith("/"):
            continue
        if len(ik) <= 2:
            continue

        kcontinue = False
        for src in ("/player.bilibili.com/",
                    "blog/", "source/shader/", "assets/glslEditor-0.0.20/"):
            if ik.startswith(src):
                kcontinue = True
        if kcontinue: continue

        if ik in ("source/hackathon2020_team24.zip",
                  "source/2D-Fourier-transforms.pdf",
                  "source/Fourier-transform-of-images.pdf",
                  "source/DevMgr-SRC.zip",
                  "source/DevMgr-DEMO.zip",
                  "images/photo.jpg",
                  "source/shader/geometry.cpp",):
            continue
        if not os.path.isdir(ik):
            line = organizeRes(ik, fpath, line)

    regex = r"""(
                    (https?)://
                        ([a-z0-9\.-]+\.[a-z]{2,6})
                        (:[0-9]{1,4})?
                    (/[a-z0-9\&%_\./~–-]*)?
                    (\?[a-z0-9\&%_\./~=:-]*)?
                    (#[a-z0-9\&%_\./~=:-]*)?
                )"""

    regex = "".join(regex.split())
    li = re.findall(regex, line, re.IGNORECASE)
    if not li: return reflist, line
    for tx in li:
        url = tx[0]
        host = tx[2]
        checkz = line.split(url)
        for xline in checkz[1:]:
            checkli = ["", ")", "]", ">", " ", "*"]
            if url in ("https://msdl.microsoft.com/download/symbols",):
                checkli.append(";")
            if xline[:2] in ("{{",):
                continue
            if not xline[:1] in checkli:
                print(line)
                print(url)
                assert False, checkz
        assert not url.endswith("."), path +" "+ url
        remote = backupUrlContent(fpath, url)
        if remote:
            reflist.append([url, remote])
        if not host in g_hostset:
            g_hostset[host] = 0
        g_hostset[host] += 1

    for tak, src, name, host in linktagli:
        # 视频要特别标注域名。
        li1 = re.findall(host, xline)
        li2 = re.findall(name+"\\]", xline)
        if len(li1) == len(li2):
            continue
        print(xline)
        print(li1)
        print(li2)
        assert False, linesrc
    return reflist, line

g_cnchar = []
g_cschar = []
g_enchar = []
g_tpset = set()
g_mdkeyset = set()
SNAPSHOT_HTML = "<font class='ref_snapshot'>参考资料快照</font>"
def removeRefs(fpath, lines):
    lineCount = len(lines)
    headIndex = -1
    for index in range(lineCount):
        i = lineCount-1 - index
        if not lines[i] or not lines[i].strip():
            continue
        if re.findall("^- \\[[0-9]+\\] \\[{}\\]\\({}\\)$".format(".*?", ".*?"), lines[i]):
            continue
        if lines[i] == SNAPSHOT_HTML:
            headIndex = i
            break
        break

    if headIndex != -1:
        assert lines[headIndex-1] == "", "%r"%lines[headIndex-1]
        assert lines[headIndex-2] == "-----", "%r"%lines[headIndex-2]
        assert lines[headIndex-3] == "", "%r"%lines[headIndex-3]
        lines = lines[:headIndex-3]
    return lines

def appendRefs(fpath, lines):
    reflist = []

    for index, line in enumerate(lines):
        ireflist, line = collectHost(fpath, line)
        lines[index] = line
        if ireflist:
            reflist.extend(ireflist)

    if reflist:
        lines.append("")
        lines.append("-----")
        lines.append("")
        lines.append(SNAPSHOT_HTML)
        lines.append("")
        lines.append("")
        urlset = set()
        count = 0
        for url, remote in reflist:
            if url in urlset: continue
            urlset.add(url)
            count = count + 1
            from urllib.parse import unquote
            remote = "{% " + ("include relref.html url=\"/%s\"" % (remote,)) + " %}"
            lines.append("- [{}] [{}]({})".format(count, url, remote))
        lines.append("")
    return lines

def mainfile(fpath, fname, ftype):

    ftype = ftype.lower()
    errcnt = 0

    warnCnEnSpace    = ftype in ("md", "php", "html", "htm",) # 英文中文空符检查
    warnTitleSpace   = ftype in ("md",) # 标题前后空行检查
    warnIndentSpace  = ftype in ("md", "php",) # 缩进检查
    isMdFile         = ftype in ("md",)
    isSrcFile        = ftype in ("md", "py", "php", "html", "htm", "js",)

    if not isSrcFile:
        if fpath.find("\\_site\\") != -1:
            g_tpset.add(ftype)
        return

    if isMdFile:
        fdata = readfile(fpath, True).strip()
        if fdata.startswith("---"):
            kvlist = fdata.split("---")[1].strip().split("\n")
            for kv in kvlist:
                kv = kv.strip()
                key, value = kv.split(":", 1)
                key = key.strip()
                value = value.strip()
                g_mdkeyset.add(key)

    if fpath.find("\\_site\\") != -1:
        return

    def linerstrip(line):
        if isMdFile:
            for tak, src, name, host in linktagli:
                # 移除多余空格
                line = line.replace("  "+tak, tak)
                line = line.replace(" "+tak, tak)
                # 格式化。
                line = line.replace(tak, " "+tak)
                line = line.replace(src, tak)
                line = line.replace("[ "+tak, "["+name+" "+tak)
            line = line.replace(" ——", "——").replace(" ——", "——")
            line = line.replace("—— ", "——").replace("—— ", "——")
            line = line.replace("——", " —— ")
        return line.rstrip()

    print(fpath)
    lines = readfileLines(fpath, False, False, "utf8")
    lines = removeRefs(fpath, lines)
    lines = [linerstrip(line) for line in lines]
    lines.append("")
    lines.append("")
    while len(lines) >= 2 and not lines[-1] and not lines[-2]:
        lines = lines[:-1]
    while len(lines) >= 1 and not lines[0]:
        lines = lines[1:]

    if fname in ("gitsrc.html",) or re.findall("^relref[a-z_]*\\.html$", fname):
        while len(lines) >= 1 and not lines[-1]:
            lines = lines[:-1]

    if isMdFile:
        lines = appendRefs(fpath, lines)

    codestate = False
    chartstate = False
    for index, line in enumerate(lines):

        preline = lines[index - 1] if index > 0 else ""
        nextline = lines[index + 1] if index < len(lines)-1 else ""

        tagregex = "^\\s*[#]+ "
        tagregexk = "^\\s*[#]+\\s{2,}"
        prelinetag = re.findall(tagregex, preline)
        nextlinetag = re.findall(tagregex, nextline)
        if warnTitleSpace:
            assert not re.findall(tagregexk, preline), preline

        if re.findall("^\\s*[*-]+ ", line):
            idtcnt = 2
        else:
            idtcnt = 4

        cnsign  = "‘’“”"
        cnregex = "\u4e00-\u9fa5"

        for ch in line:
            ordch = ord(ch)
            regch = "\\u%04x"%(ordch)
            if ordch <= 0x7F or isDiacritic(ch):
                g_enchar.append(ch)
                continue
            if ordch >= 0x4e00 and ordch <= 0x9fa5:
                if cnregex.find(regch) == -1:
                    cnregex += regch
                if g_cnchar.count(ch) == 0:
                    g_cnchar.append(ch)
            else:
                if cnsign.find(regch) == -1:
                    cnsign += regch
                if g_cschar.count(ch) == 0:
                    g_cschar.append(ch)
        cnregex += cnsign

        if line.find("\xa0") != -1 and not fname in ("glslEditor.min.js",):
            print("xspace", fpath, line)
            errcnt += 1

        #liw = re.findall("[{}]+".format(cnregex,), line, re.IGNORECASE)
        #lia = re.findall("[^{}]+".format(cnregex,), line, re.IGNORECASE)

        linec = line
        for itmp in re.findall("\\$\\$.*?\\$\\$", line): # 忽略数学公式
            linec = linec.replace(itmp, "$$$$")
        for itmp in re.findall("“.*?”", line): # 忽略双引号
            linec = linec.replace(itmp, "“”")

        lix1 = re.findall("[{}][^{} *]".format(cnregex, cnregex), linec, re.IGNORECASE)
        lix2 = re.findall("[^{} *][{}]".format(cnregex, cnregex), linec, re.IGNORECASE)
        lix = []
        lix.extend(lix1)
        lix.extend(lix2)

        cnsignregex = "[{}]".format(cnsign)
        for ix in lix:
            cx, cy = ix
            if re.findall(cnsignregex, cy) or re.findall(cnsignregex, cx):
                continue
            if cy in "-<]" or cx in "->[":
                continue

            if chartstate:
                continue

            if cx in ("\"", "[") and (" "+line).count(" "+ix) == 1:
                continue
            if cy in ("\"", "]", ",") and (line+" ").count(ix+" ") == 1:
                continue

            if cx in ("(", ) and (" \\"+line).count(" \\"+ix) == 1:
                continue
            if cy in ("\\", ) and (line+") ").count(ix+") ") == 1:
                continue

            if cx in ("\"",) and ("["+line).count("["+ix) == 1:
                continue
            if cy in ("\"",) and ((line+"]").count(ix+"]") == 1 or (line+",").count(ix+",") == 1):
                continue

            if cy in (".") and (line.count(ix+"rar") == 1 or line.count(ix+"zip") == 1):
                continue

            if not warnCnEnSpace:
                continue

            if codestate:
                if cy in "\":" or cx in "\":":
                    continue

                if line.startswith("print ("):
                    continue

            print("[%d]"%(index+1), ix, cx, cy, "\t", line)
            errcnt += 1
            if AUTOFORMAT:
                line = line.replace(ix, cx+" "+cy)
                lines[index] = line

        fxline = "".join(line.split())
        if fxline.startswith("<divclass=\"mermaid\"") and not chartstate:
            chartstate = True
        if fxline.startswith("</div>") and chartstate:
            chartstate = False

        if fxline.startswith("{%highlight"):
            codestate = True
            continue
        if fxline.startswith("{%endhighlight%}"):
            codestate = False
            continue

        if fxline.startswith("```") and not codestate:
            codestate = True
            continue
        if fxline.startswith("```") and codestate:
            codestate = False
            continue

        if codestate:
            continue

        if warnTitleSpace and (prelinetag or nextlinetag):
            if line:
                openTextFile(fpath)
                assert False, "{}:{} {}".format(fpath, index+1, line)

        countspace = getLeftSpaceCount(line if warnIndentSpace else line.replace("\t", " "*4))
        if countspace > 12 or countspace % idtcnt == 0:
            pass # ok
        elif warnIndentSpace:
            openTextFile(fpath)
            assert False, "{}:{} \"{}\"".format(fpath, index+1, line)

    page = "\r\n".join(lines)
    while page.find("\r\n" * 3) != -1:
        page = page.replace("\r\n" * 3, "\r\n" * 2)

    codereg = "\\{\\%\\s*highlight.*?\\{\\%\\s*endhighlight\\s*\\%\\}"
    codeli1 = re.findall(codereg, page, re.MULTILINE | re.IGNORECASE | re.DOTALL)

    coderegz = "```.*?```"
    codeli1z = re.findall(coderegz, page, re.MULTILINE | re.IGNORECASE | re.DOTALL)

    if warnTitleSpace:
        page = page.replace("\r\n"*2+"### ", "\r\n"*3+"### ")
        page = page.replace("\r\n"*2+"## ",  "\r\n"*3+"## ")
        page = page.replace("\r\n"*2+"# ",   "\r\n"*3+"# ")

    codeli2 = re.findall(codereg, page, re.MULTILINE | re.IGNORECASE | re.DOTALL)
    for i in range(len(codeli1)):
        page = page.replace(codeli2[i], codeli1[i])

    codeli2z = re.findall(coderegz, page, re.MULTILINE | re.IGNORECASE | re.DOTALL)
    for i in range(len(codeli1z)):
        page = page.replace(codeli2z[i], codeli1z[i])

    writefile(fpath, page.encode("utf8"))
    return errcnt

def viewchar(lichar, xfile, xmin, xmax):
    li = list(set("".join(lichar)))
    li.sort()
    page = ""
    minv, maxv = 1024, 0
    for index, tchar in enumerate(li):
        page += tchar
        if (index + 1) % 50 == 0:
            page += "\r\n"
        if isDiacritic(tchar):
            continue
        minv = min(minv, ord(tchar))
        maxv = max(maxv, ord(tchar))
    tempfile = os.path.join("tempdir", xfile)
    writefile(tempfile, page.encode("utf8"))

    if OPENFILE:
        openTextFile(tempfile)
    print(minv, maxv)
    print([("%04x"%ord(k), k) for k in li[:5]]),
    print([("%04x"%ord(k), k) for k in li[-5:]])
    assert xmin <= minv and maxv <= xmax

def mainfilew(fpath, fname, ftype):
    if checklog(__file__, fpath) and not REBUILD:
        # print("cached", fpath)
        return 0
    removelog(__file__, fpath)
    errcnt = mainfile(fpath, fname, ftype)
    if errcnt == 0:
        savelog(__file__, fpath)
    return errcnt

def main():
    print(parsePythonCmdx(__file__))
    removedirTimeout("tempdir")
    clearemptydir("tempdir")
    buildSnapCache("backup")
    searchdir(".", mainfilew, ignorelistMore=(
        "backup", "d2l-zh", "mathjax", "tempdir", "msgboard",
        "Debug", "Release", ".vs", "openglcpp", "opengl-3rd",))
    if REBUILD:
        clearSnapCache()
        clearemptydir("images")
        clearemptydir("source")
        organizeClear()

    global g_cschar
    global g_tpset

    viewchar(g_cnchar, "cnfile.txt", 0x80, 0x7FFFFFFF)
    viewchar(g_cschar, "csfile.txt", 0x80, 0x7FFFFFFF)
    viewchar(g_enchar, "enfile.txt", 0x0,  0x7F)

    print(LINE_SEP_SHORT)
    g_cschar = list(set(g_cschar))
    g_cschar.sort()
    print("".join(g_cschar))
    imgset  = ("jpeg", "jpg", "png", "gif", )
    fontset = ("eot", "ttf", "woff", "svg", "woff2", )
    codeset = ("cc", "js", "txt", "xml", "css", "mk", "lock", "zip", "makefile", )
    g_tpset -= set(imgset)
    g_tpset -= set(fontset)
    g_tpset -= set(codeset)
    print(g_tpset)
    print(g_mdkeyset)

    hostlist = sorted(g_hostset.items(), key=lambda x: x[1], reverse=True)
    print(hostlist)
    for hostx in hostlist[:10]:
        print(hostx)

if __name__ == "__main__":
    main()
