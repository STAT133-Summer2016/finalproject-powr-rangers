library(readr)
library(stringr)
# This script downloads the datasets for our project and reformats them 
# into the correct form.

downloadfile = function(url, filename, outfilename){
  # This function downloads a file from the dataset website, unzips it, 
  # and compresses it into a bz2.
  #
  # Args:
  #  url: Name of zipped file
  #  filename: Name of file inside zip
  #  outfilename: Name of Output file
  prefix_url = "https://www.huduser.gov/portal/datasets/hads/"
  temp = tempfile()
  download.file(str_c(prefix_url, url), temp)
  csv = read_csv(unz(temp, filename))
  unlink(temp)
  format = bzfile(outfilename)
  write.csv(csv, format)
}

# All of the zip file names
compressed = c("hads2013n_ASCII.zip",
               "hads2011(ASCII).zip",
               "hads2009(ASCII)_v2.exe",
               "hads2007(ASCII)_v2.exe",
               "hads2005(ASCII)_v2.exe",
               "hads2003(ASCII).exe",
               "hads2001(ASCII).exe",
               paste0("hads", seq(99,85,-2), "(ASCII).exe"))

# All of the unzipped file names
unzipped = c("thads2013n.txt",
             str_c("thads", seq(2011,2005,-2), ".txt"),
             str_c("hads", seq(2003,2001,-2), ".txt"),
             str_c("hads", seq(99,85,-2), ".txt"))

#Output names
actualnames = str_c("hads", seq(2013,1985,-2), ".bz2")

mapply(downloadfile, compressed, unzipped, actualnames)