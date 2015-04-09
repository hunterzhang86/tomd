# $1、$2分别是 存放HTML文件的文件夹 和 你要存放的笔记分支， 笔记分支比如 test

mkdir $1/photo

# 把图片转移到笔记的photo文件夹下，可以根据自己的情况修改，否则html中的图片显示会有一些问题
mv $1/*files/*.png $1/*files/*.PNG $1/*files/*.jpg $1/*files/*.JGP $1/*files/*.jpeg $1/*files/*.JPEG $1/photo

for filename in `ls $1`
do
	fname=`basename $filename`
	if [[ $fname == *.html ]]
	then
		fname=`basename $filename .html`
		name=${fname%.*}
		echo $name
		python  html2text.py $1$name.html utf8 > $1$name.md
	fi
done

cp -R $1/photo $1/*.md /Users/apple/Documents/mynote/$2

if $1 != $2
	rm -Rf $1/photo
fi

rm -Rf $1/*files
rm $1/*.html

echo "Success"

exit