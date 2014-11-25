# Set string Variables
localdir=getwd()
#file suffix
filename="StormData.csv.bz2"

download_data=function(){
# IF file doesn't exist in working directory, 
# and no storm dataframe exists, dl and expand data file.
if(
  !(
    file_test(op="-d",x=paste(localdir,filename,sep='/')) ||
      (exists("storm"))
    )
){
  # create a temporary file and a temporary directory on your local disk
  tf <- tempfile()
  td <- tempdir()
  
  # run the download file function, download as binary..  save the result to the temporary file
  download.file(
    "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
    "StormData.csv",
    mode = 'wb' 
  )

}

}

read_data = function(){
df = read.csv("StormData.csv.bz2",header = TRUE,stringsAsFactors=FALSE) 

## Create coherent data frame

return(df)
}

