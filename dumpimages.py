"""
dumpimages.py
    Downloads all the images on the supplied URL, and saves them to the
    specified output file ("./photo/" by default)

Usage:
    python dumpimages.py http://example.com/ [output]
"""

from BeautifulSoup import BeautifulSoup as bs
import urlparse
from urllib2 import urlopen
from urllib import urlretrieve
import os
import sys

def main(url, html_folder="./"):
    """Downloads all the images at 'url' to ./photo/"""

    if not os.path.exists(html_folder):
        os.makedirs(html_folder)

    out_folder = "".join([html_folder, "photo/"])

    if not os.path.exists(out_folder):
        os.makedirs(out_folder)

    soup = bs(urlopen(url))
    parsed = list(urlparse.urlparse(url))

    html_file = "".join([html_folder, soup.title.string.replace(" ", "")])
    html_file = "".join([html_file, ".html"])
    urlretrieve(url, html_file)

    for image in soup.findAll("img"):
        print "Image: %(src)s" % image
        filename = image["src"].split("/")[-1]
        parsed[2] = image["src"]
        outpath = os.path.join(out_folder, filename)
        if image["src"].lower().startswith("http"):
            urlretrieve(image["src"], outpath)
        else:
            urlretrieve(urlparse.urlunparse(parsed), outpath)

def _usage():
    print "usage: python dumpimages.py http://example.com [outpath]"

if __name__ == "__main__":
    url = sys.argv[-1]
    html_folder = "./"
    out_folder = "./photo/"
    if not url.lower().startswith("http"):
        html_folder = sys.argv[-1]
        out_folder = "".join([sys.argv[-1], "photo/"])
        url = sys.argv[-2]
        if not url.lower().startswith("http"):
            _usage()
            sys.exit(-1)
    main(url, html_folder)