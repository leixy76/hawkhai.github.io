#encoding=utf8
import sys
import re, os, sys
sys.path.append("../")
import datetime, time
from urllib.parse import unquote
from pythonx.funclib import *

AUTOFORMAT = "format" in sys.argv
URL_REGEX = r"""(
                    (https?)://
                        (?:([a-z0-9\.-]+\.[a-z]{2,6})|
                            ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+))
                        (:[0-9]{1,4})?
                    (/[a-z0-9\&%_\./~=+:@–-]*)?
                    (\?[a-z0-9\&%_\./~=:\[\]-]*)?
                    (#[a-z0-9\&%_\./~=:?-]*)?
                )"""
URL_REGEX = "".join(URL_REGEX.split())
#li = re.findall(regex, line, re.IGNORECASE)

OTIMG_REGEX = """(\\!\\[(.*?)\\]\\((.*?\\.(?:jpg|png))\\))"""
EQUA_REGEX  = """(\\!\\[\\[公式\\]\\]\\(https://www.zhihu.com/equation\\?tex=(.*?)\\))""".encode("utf8").decode("ISO8859-1")

def twikiImage(line):
    # ![](/download/attachments/186253641/image2021-9-9_17-21-5.png?version=1&modificationDate=1631179266000&api=v2)
    regex = '''(\!\[\]\((/download/[a-z]+/[0-9]+/[a-z0-9-_%]+.[a-z]+\?version=1&modificationDate=[0-9]+&api=v2)\))'''
    # ![](/download/attachments/158302446/图片1.png?version=1&modificationDate=1614668176000&api=v2)
    # ![](/download/thumbnails/158302411/image_3.png?version=1&modificationDate=1614667438000&api=v2)
    li = re.findall(regex, line, re.IGNORECASE)
    for i in li:
        print(i)
        xline, imgurl = i
        imgn = imgurl.split("?")[0].split("/")[-1].replace("%", "")
        imgurl = r"https://twiki.cmcm.com" + imgurl
        imgname = os.path.join("images", getmd5(imgurl)+imgn)
        writefile(imgname, netget(imgurl, headers={
        "Cookie": "_ga=GA1.2.1243953186.1638896876; seraph.confluence=213614602:efe41e78223b605cc146d16fc2d5fea430da4601; JSESSIONID=096648D625B3347496C69F326E4E1B8C; Hm_lvt_e4f1d184255c7bd7d09a7739c36aaa96=1645257776,1646671105,1647188362,1647532002; Hm_lpvt_e4f1d184255c7bd7d09a7739c36aaa96=1647532025",
        }))
        yline = '''{%% include image.html url="/images/%s" %%}''' % (imgn,)
        line = line.replace(xline, yline)
    return line

def mainfilew(fpath, fname, ftype):
    if not ftype in ("md",): return
    fdata = readfile(fpath, True)
    fdatabak = fdata[:]

    li = fdata.split("\r\n")
    li2 = []
    first = True

    chekurlx = set()
    for line in li:
        for url in re.findall(URL_REGEX, line, re.IGNORECASE):
            chekurlx.add(url[0])
    for url in chekurlx:
        urlx = url + "/"
        if urlx in chekurlx:
            openTextFile(fpath)
            assert False, urlx

    codestate = False
    for line in li:

        line = twikiImage(line)

        fxline = "".join(line.split())
        if fxline.startswith("{%highlight"):
            codestate = True
            li2.append(line)
            continue
        if fxline.startswith("{%endhighlight%}"):
            codestate = False
            li2.append(line)
            continue

        if fxline.startswith("```") and not codestate:
            codestate = True
            li2.append(line)
            continue
        if fxline.startswith("```") and codestate:
            codestate = False
            li2.append(line)
            continue

        if codestate:
            li2.append(line)
            continue

        htimgs = re.findall(OTIMG_REGEX, line, re.IGNORECASE)
        if htimgs:
            assert len(htimgs) == 1, htimgs
            htimg = htimgs[0]
            print(htimg)
            txline, txtitle, txurl = htimg
            img = netget(txurl)
            imgname = getmd5(txurl)[:4]+"_"+txurl.split("/")[-1]
            imglocal = os.path.join("images", imgname)
            writefile(imglocal, img)
            newline = "{} 0".format(imgname)
            if not txtitle:
                line = line.replace(txline, newline)

        # ![[公式]](https://www.zhihu.com/equation?tex=.*?)
        htimgs = re.findall(EQUA_REGEX, line, re.IGNORECASE)
        if htimgs:
            #print(htimgs)
            for txline, txcontent in htimgs:
                txcontent = unquote(txcontent)
                print(txline, txcontent)
                newline = " $${}$$ ".format(txcontent)
                line = line.replace(txline, newline)

        chxx = u"：。".encode("utf8").decode("ISO8859-1")
        result = re.findall("[^\\s%s](%s)\\s"%(chxx, URL_REGEX), " %s "%line, re.IGNORECASE)
        if result:
            openTextFile(fpath)
            assert False, result
        result = re.findall("[\\s%s](%s)\\s"%(chxx, URL_REGEX), " %s "%line, re.IGNORECASE)
        if result:
            if first:
                print(fpath, result)
                first = False
            assert len(result) == 1
            result = result[0]
            url = result[0]
            line = line.replace(url, "<{}>".format(url))
            print("\t"*1, url, line)
            li2.append(line)
        else:
            li2.append(line)

    if codestate:
        openTextFile(fpath)
        assert not codestate

    fdata = "\r\n".join(li2)

    fname = os.path.split(fpath)[-1]
    if fdata != fdatabak and AUTOFORMAT: # and fname in sys.argv:
        print("writefile", fpath)
        writefile(fpath, fdata)

def main():
    print(parsePythonCmdx(__file__))
    searchdir(".", mainfilew, ignorelist=(
        "backup", "d2l-zh", "mathjax", "tempdir", "msgboard",
        "Debug", "Release", ".vs", "openglcpp", "opengl-3rd", "opengles3-book", "opengles-book-samples",
        "UserDataSpider", "docs.gl",
        ), reverse=True)

if __name__ == "__main__":
    print(sys.argv)
    if len(sys.argv) >= 2 and os.path.isdir(sys.argv[1]):
        workdir = sys.argv[1]
        @CwdDirRun(workdir)
        def maingo():
            main()
        maingo()
    else:
        main()
    print(parsePythonCmdx(__file__))
