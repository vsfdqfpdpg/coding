#/bin/bash
BlockedUrl=(iqiyi.com zhiboo.net zhiboba.cc fanxing.com zhanqi.com woxiu.com kktv5.com yizhibo.com us.sinaimg.cn vlook.cn xiaokaxiu.com miaopai.com www.yy.com www.6.cn video.weibo.com narutom.com u17.com bilibili.com kumi.cn acfun.cn tvmao.com vmovier.com bale.cn 9xiu.com fanxing.kugou.com chushou.tv longzhu.com huya.com panda.tv douyu.com tvsou.com ipanda.com aipai.com wasu.cn baomihua.com v1.cn joy.cn mgtv.com tangdou.com v.baidu.com pptv.com fun.tv pps.tv baofeng.com ku6.com cntv.cn video.sina.com.cn kankan.com tv.sohu.com tudou.com youku.com 56.com v.qq.com v.ifeng.com)
BlockedUrl=(www.iqiyi.com)
for i in ${BlockedUrl[@]}; do
     echo "iptables -I FORWARD -p tcp -m time --timestart 13:41 --timestop 18:00 --kerneltz -m webstr --url $i -j REJECT --reject-with tcp-reset"
     echo "iptables -I FORWARD -m webstr --url $i -m time --timestart 13:41 --timestop 18:00 --weekdays 1,2,3,4,5,6 -j REJECT"
done