# function for joining arrays
# thank you to
# https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-an-array-in-bash
function join_by { local IFS="$1"; shift; echo "$*"; }

# give name to dedirectorized directory
dedirectorizeddirectory="dedirectorized/"

IFS=$'\n' # use only line breaks as delimiters

# iterate over all files in all subdirectories of current directory
# ignoring .DS_Store, Icon?
for i in $( find * -type f ! -name '*.DS_Store' ! -name 'Icon?' ! -name 'dedirectorize.sh'); do
  # split item via forward slashes (levels of query)
  IFS='/.'
  # read the split items into an array
  read -r -a directoryarray <<< "$i"
  finalfilename=$(join_by . ${directoryarray[@]})
  # resetting linebreaks as only delimiters
  IFS=$'\n'
  # prepare location for cp command so that files are renamed in process.
  finallocation="${dedirectorizeddirectory}${finalfilename}"
  # create directory into which to copy files
  mkdir -p $dedirectorizeddirectory
  # copy files
  cp $i $finallocation
done
