# $1、$2 、$3分别是 是否抽取正文 、 url链接 、你要存放笔记的文件夹 ， 形如: sudo sh tomarkdown2.sh http://www.example.com ../test/

sudo python htm_body_extractor.py $1 $2 $3

for filename in `ls $3`
do
	fname=`basename $filename`
	if [[ $fname == *.html ]]
	then
		fname=`basename $filename .html`
		name=${fname%.html}
		echo $name
		python html2text.py $3$name.html utf8 > $3$name.md
	fi
	# rm $2$name.html
done

echo "Success !"

exit