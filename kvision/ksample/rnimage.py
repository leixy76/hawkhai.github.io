#encoding=utf8
import re, os, sys
for reldirx, _lidir in (("./", []), (os.path.split(__file__)[0]+"/", [])):
    while not _lidir and len(reldirx) <= 100:
        reldirx += "../"
        checkfunc = lambda idir: os.path.exists(reldirx+idir+"/pythonx/funclib.py")
        _lidir = [reldirx+idir for idir in os.listdir(reldirx) if checkfunc(idir)]
        if _lidir: reldirx = _lidir[0]
    if _lidir: break
sys.path.append(reldirx)
from pythonx.funclib import *
from PIL import Image

def main(rootdir):
    print("rootdir", rootdir)
    input("Press Enter to continue...")
    count = 0
    kset = set()
    def mainfile(fpath, fname, ftype):
        if not ftype in ("png", "webp", "jpg",):
            return

        if re.findall("^[0-9]{3}_[0-9a-f]{5}\\.", fname):
            print("ignore", fpath)
            return

        print(fpath)

        img = Image.open(fpath)
        sign = "{} {} {} {}".format(img.size, img.mode, os.path.getsize(fpath), getFileMd5(fpath))
        img.close()
        if sign in kset:
            return
        kset.add(sign)

        nonlocal count
        count = count + 1
        zname = "{}_{}.{}".format("%03d"%count, getmd5(sign)[:5], ftype)
        print(zname)

        imgdir, imgname = os.path.split(fpath)
        zpath = os.path.join(imgdir, zname)
        copyfile(fpath, zpath)
        os.unlink(fpath)

    searchdir(rootdir, mainfile, numnamesort=False)

    count = 0
    def mainfile2(fpath, fname, ftype):
        xcf = re.findall("^([0-9]{3})_([0-9a-f]{5})\\.", fname)
        if not xcf: return

        xcf = xcf[0]
        idx, name = xcf

        nonlocal count
        count += 1
        idx2 = "%03d" % count
        if idx == idx2: return
        print(xcf)
        os.rename(fpath, fpath.replace(idx+"_"+name, idx2+"_"+name))

    searchdir(rootdir, mainfile2, numnamesort=False)

if __name__ == "__main__":
    #main(os.path.dirname(os.path.abspath(__file__)))
    main(os.path.abspath("."))
    print("ok")
