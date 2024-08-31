#encoding=utf8
import re, os, sys
for reldirx, _lidir in (
        (os.path.dirname(os.path.abspath(__file__)), []), # 这个先，规避加载漏洞。
        (os.path.dirname(os.path.abspath(".")), [])):
    while not _lidir and len(reldirx) > 3: # 3 应该所有平台都问题不大。
        reldirx = os.path.dirname(reldirx) # 只尝试 funclib.py，funclib.pyc 存在版本。
        _checkfunc = lambda idir: os.path.exists(os.path.join(reldirx, idir, "pythonx", "funclib.py"))
        _lidir = [os.path.join(reldirx, idir) for idir in os.listdir(reldirx) if _checkfunc(idir)]
        assert len(_lidir) in (0, 1), _lidir
        if _lidir: reldirx = os.path.abspath(_lidir[0])
        del _checkfunc
    if _lidir: break
if not reldirx in sys.path: sys.path.append(reldirx) # 放到最后，避免 sys.path.insert
del _lidir # reldirx 可以继续使用
if not os.getcwd() in sys.path: # fix linux 软连接的 bug
    sys.path.append(os.getcwd())
import time
from pythonx.funclib import *
from pythonx.pelib import *
from PIL import Image, ImageDraw, ImageFont

import os
import clip
import torch
#from torchvision.datasets import CIFAR100
import cv2
from PIL import Image
import numpy as np

# 官网推荐的 'ViT-B/32'
# ViT-L/14 37.6M 1.71GB
# ViT-B/32 21.6M 605MB
# ViT-B/16 17.6M 598MB
# C:\Users\hawkhai\.cache\clip\ViT-L-14.pt 910MB
DEVAULTV_CLIP   = ('ViT-B/32', "ViT-L/14") # 224 MB / 610 MB
# 官网推荐的 "ViT-B-16"
# ViT-L-14 44K 1.63GB
# ViT-B-16 19.9K 753MB
# D:\kSource\blog\kvision\imgclassify\clip_cn_vit-l-14.pt 1587MB
DEVAULTV_CNCLIP = ('ViT-B-16', "ViT-L-14") # 200 MB / 600 MB

# https://github.com/openai/clip
# Load the model
device = "cuda" if torch.cuda.is_available() else "cpu"
model, preprocess = clip.load(DEVAULTV_CLIP[1], device)

# https://github.com/OFA-Sys/Chinese-CLIP
import cn_clip.clip as cn_clip
from cn_clip.clip import load_from_name, available_models
print("Available models:", available_models())
# Available models: ['ViT-B-16', 'ViT-L-14', 'ViT-L-14-336', 'ViT-H-14', 'RN50']

# os.path.expanduser("~/.cache")
dlrootdir = os.path.split(os.path.abspath(__file__))[0]
model_cn, preprocess_cn = load_from_name(DEVAULTV_CNCLIP[1], device=device, download_root=dlrootdir)
model_cn.eval()

def test():
    from torchvision.datasets import CIFAR100

    # Download the dataset
    cifar100 = CIFAR100(root=dlrootdir, download=True, train=False)

    # Prepare the inputs
    image, class_id = cifar100[3637]
    print(type(image), class_id)
    image_input = preprocess(image).unsqueeze(0).to(device)
    text_inputs = torch.cat([clip.tokenize(f"a photo of a {c}") for c in cifar100.classes]).to(device)

    # Calculate features
    with torch.no_grad():
        image_features = model.encode_image(image_input)
        text_features = model.encode_text(text_inputs)

    # Pick the top 5 most similar labels for the image
    image_features /= image_features.norm(dim=-1, keepdim=True)
    text_features /= text_features.norm(dim=-1, keepdim=True)
    similarity = (100.0 * image_features @ text_features.T).softmax(dim=-1)
    values, indices = similarity[0].topk(5)

    # Print the result
    #print("\nTop predictions:\n")
    for value, index in zip(values, indices):
        print(f"{cifar100.classes[index]:>16s}: {100 * value.item():.2f}%")

def getMaxKV(retmap):
    keys = [k for k in retmap.keys()]
    #assert len(keys) in (5, 12), keys
    keys.sort()
    vals = [retmap[k] for k in keys]

    max_val = max(vals)
    max_idx = vals.index(max_val)
    return keys[max_idx], max_val

# Download the dataset
#cifar100 = CIFAR100(root=os.path.expanduser("~/.cache"), download=True, train=False)
def cateclip(image, classes):
    # Prepare the inputs
    #image, class_id = cifar100[3637]
    image_input = preprocess(image).unsqueeze(0).to(device)

    classe_ids = [c.split(":")[-1].strip() for c in classes]
    classes = [c.split(":")[0].strip() for c in classes]
    #print(classe_ids)
    #print(classes)
    text_inputs = torch.cat([clip.tokenize(f"a photo of a {c}") for c in classes]).to(device)

    # Calculate features
    with torch.no_grad():
        image_features = model.encode_image(image_input)
        text_features = model.encode_text(text_inputs)

    # Pick the top 5 most similar labels for the image
    image_features /= image_features.norm(dim=-1, keepdim=True)
    text_features /= text_features.norm(dim=-1, keepdim=True)
    similarity = (100.0 * image_features @ text_features.T).softmax(dim=-1)
    values, indices = similarity[0].topk(5)

    # Print the result
    #print("\nTop predictions:\n")
    retmap = {}
    for value, index in zip(values, indices):
        #print(f"{classes[index]:>16s}: {100 * value.item():.2f}%")
        #return classe_ids[index], value.item()
        if not classe_ids[index] in retmap:
            retmap[classe_ids[index]] = 0
        retmap[classe_ids[index]] += value.item()

    return getMaxKV(retmap)

def cateclip_cn(image, classes):

    classe_ids = [c.split(":")[-1].strip() for c in classes]
    classes = [c.split(":")[0].strip() for c in classes]

    #print(classe_ids)
    #print(classes)
    image = preprocess(image).unsqueeze(0).to(device)
    text = cn_clip.tokenize([f"一张 {c} 照片" for c in classes]).to(device)

    with torch.no_grad():
        image_features = model_cn.encode_image(image)
        text_features = model_cn.encode_text(text)
        # 对特征进行归一化，请使用归一化后的图文特征用于下游任务
        image_features /= image_features.norm(dim=-1, keepdim=True)
        text_features /= text_features.norm(dim=-1, keepdim=True)

        logits_per_image, logits_per_text = model_cn.get_similarity(image, text)
        probs = logits_per_image.softmax(dim=-1).cpu().numpy()

    # 创建一个 numpy 数组
    float_array = np.array(probs[0])
    # 找到最大值
    max_value = np.max(float_array)
    # 找到最大值的索引
    max_index = np.argmax(float_array)
    #print("Label probs:", probs)  # [[1.268734e-03 5.436878e-02 6.795761e-04 9.436829e-01]]
    #return classe_ids[max_index], max_value
    retmap = {}
    for index, value in enumerate(probs[0]):
        if not classe_ids[index] in retmap:
            retmap[classe_ids[index]] = 0
        retmap[classe_ids[index]] += value

    return getMaxKV(retmap)

# 自然界（如动物、植物）
# 人造环境（如建筑、交通工具）
# 日常生活中的各种物品和场景（如食物、日常物品、夜景、人物、风景）
# 特定的图像类型（如动漫/卡通、文本/扫描件）
def main(dataset):
    classes = r"""
animal
anime:cartoon
cartoon
building
architecture:building
food
goods
Everyday Objects:goods
nightscape
people
human:people
plant
scenery:landscape
landscape
text
scanned document:text
vehicle
transportation:vehicle
    """.strip().split("\n")
    classes = [i.strip() for i in classes]
    classes_cn = r"""
动物:animal
动漫:cartoon
卡通:cartoon
建筑:building
食物:food
日常物品:goods
夜景:nightscape
人物:people
植物:plant
风景:landscape
文本:text
扫描件:text
交通工具:vehicle
    """.strip().split("\n")
    classes_cn = [i.strip() for i in classes_cn]
    #for dir in os.listdir(dataset):
    def mainfile(fpath, fname, ftype):
        #subdir = os.path.join(dataset, dir)
        #if not os.path.isdir(subdir):
        #    continue
        #for idir in os.listdir(subdir):
        if True:
            ifile = fpath # os.path.join(subdir, idir)
            if ifile.endswith(".txt"):
                return

            print("***" * 30)
            print(ifile)
            image = Image.open(ifile)
            idx1, idv1 = cateclip(image, classes)
            print(idx1, idv1)
            idx2, idv2 = cateclip_cn(image, classes_cn)
            print(idx2, idv2)
            #break
            if idx1 != idx2:
                return
            if idv1 < 0.5 or idv2 < 0.5:
                return

            fmd5 = getFileMd5(ifile)[:16]
            rad = int(fmd5, 16) % 100

            if rad < 20:
                targetfile = os.path.join("tempset", "val", idx1, fmd5+fname)
            else:
                targetfile = os.path.join("tempset", "train", idx1, fmd5+fname)
            fdir = os.path.dirname(targetfile)
            if not os.path.exists(fdir):
                os.makedirs(fdir)
            image.save(targetfile)
            osremove(ifile)

    searchdir(dataset, mainfile)

# 还需要移除相似图片。
if __name__ == "__main__":
    #test()
    main("dataset")
    main("valset")
    print("ok")
