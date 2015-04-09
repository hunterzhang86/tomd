# 使用方法

---


- 把URL文章直接转换成markdown格式的方法(抽取正文)
```
sudo sh tomarkdown2.sh y http://www.example.com ./test/
```

- 把URL文章直接转换成markdown格式的方法(不抽取正文)
```
sudo sh tomarkdown2.sh n http://www.example.com ./test/
```

- 把从chrome下载的html文件直接转换成markdown格式的方法
```
sudo sh tomarkdown.sh htmldir markdowndir
```