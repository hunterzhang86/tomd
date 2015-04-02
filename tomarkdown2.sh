# $1、$2分别是存放HTML文件的文件夹 和 你要存放的笔记分支 ， 笔记分支比如 test

sudo python htm_body_extractor.py $1 $2

for filename in `ls $2`
do
	fname=`basename $filename`
	if [[ $fname == *.html ]]
	then
		fname=`basename $filename .html`
		name=${fname%.html}
		echo $name
		python html2text.py $2$name.html utf8 > $2$name.md
	fi
	# rm $2$name.html
done

echo "Success !"

exit