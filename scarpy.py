import requests
import extract_utils
import bs4

import re
import os
from urlparse import urlparse
import extract_utils
import sys

from BeautifulSoup import BeautifulSoup
from urllib2 import urlopen
from urllib import urlretrieve

from multiprocessing import Pool

import subprocess

def get_urls():
	html = extract_utils.get_html(root_url)
	soup = BeautifulSoup(html)
	urls = []
	for links in soup.findAll('h2'):
		print links
		urls.append(links.a['href'])
		print urls
	return urls

def tomarkdown(url):
	cmd="sudo sh tomarkdown2.sh y %s ~/test/" %url
	print cmd
	subprocess.Popen(cmd, shell=True)

root_url = 'http://www.williamlong.info/'

urls = get_urls()

pool = Pool(8)
pool.map(tomarkdown, urls)
pool.close()
