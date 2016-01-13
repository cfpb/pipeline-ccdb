import urllib2

source = "https://data.consumerfinance.gov/api/views/s6ew-h6mp/rows.csv?accessType=DOWNLOAD"
tmp_name = "data/cfpb_ccdb.csv"

#url = "http://download.thinkbroadband.com/10MB.zip"
#file_name = url.split("/")[-1]

u = urllib2.urlopen(source)
f = open(tmp_name, "wb")
meta = u.info()
tmp_size = int(meta.getheaders("Content-Length")[0])
print "Downloading: %s Bytes: %s" % (tmp_name, tmp_size)

file_size_dl = 0
block_sz = 8192
while True:
    buffer = u.read(block_sz)
    if not buffer:
        break

    file_size_dl += len(buffer)
    f.write(buffer)
    status = r"%10d  [%3.2f%%]" % (file_size_dl, file_size_dl * 100. / tmp_size)
    status = status + chr(8)*(len(status)+1)
    print status,

f.close()