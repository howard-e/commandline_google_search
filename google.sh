#!/bin/bash
# @author Howard Edwards
# google.sh ~ Using Google's search engine to perform a web search or to open a web address directly
# Conversion of google.bat to a shell script
# Usage: google.sh <query> (on Windows)

# Checking if the number of command line arguments < 1
if [ "$#" -lt 1 ]; then
    echo "Usage:: google.sh <query>"
    exit
fi

command=""
case "$(uname -s)" in
	Darwin)
		command=open
		;;

   	Linux)
     	command=xdg-open
     	;;

   	MINGW32*|MINGW64*|MSYS*|CYGWIN*)
		command=start
     	;;

   	*)
esac

# Checking if the # of command line arguments is >= 1
if [[ "$#" -ge 1 ]]; then

	# Check if # of command line arguments = 1
	if [[ "$#" -eq 1 ]]; then
		QUERY=$1
		# Checks to see if search query contains common top level domain extensions
		if [[ $QUERY == *".com"* || $QUERY == *".org"* || $QUERY == *".net"* || $QUERY == *".gov"* || $QUERY == *".edu"* 
			|| $QUERY == *".ac"* || $QUERY == *".ad"* || $QUERY == *".ae"* || $QUERY == *".af"* 
			|| $QUERY == *".ag"* || $QUERY == *".ai"* || $QUERY == *".al"* || $QUERY == *".am"* 
			|| $QUERY == *".an"* || $QUERY == *".ao"* || $QUERY == *".aq"* || $QUERY == *".ar"* 
			|| $QUERY == *".as"* || $QUERY == *".at"* || $QUERY == *".au"* || $QUERY == *".aw"* 
			|| $QUERY == *".ax"* || $QUERY == *".az"* || $QUERY == *".ba"* || $QUERY == *".bb"* 
			|| $QUERY == *".bd"* || $QUERY == *".be"* || $QUERY == *".bf"* || $QUERY == *".bg"* 
			|| $QUERY == *".bh"* || $QUERY == *".bi"* || $QUERY == *".bj"* || $QUERY == *".bm"* 
			|| $QUERY == *".bn"* || $QUERY == *".bo"* || $QUERY == *".bq"* || $QUERY == *".br"* 
			|| $QUERY == *".bs"* || $QUERY == *".bt"* || $QUERY == *".bv"* || $QUERY == *".bw"* 
			|| $QUERY == *".by"* || $QUERY == *".bz"* || $QUERY == *".ca"* || $QUERY == *".cc"* 
			|| $QUERY == *".cd"* || $QUERY == *".cf"* || $QUERY == *".cg"* || $QUERY == *".ch"* 
			|| $QUERY == *".ci"* || $QUERY == *".ck"* || $QUERY == *".cl"* || $QUERY == *".cm"* 
			|| $QUERY == *".cn"* || $QUERY == *".co"* || $QUERY == *".cr"* || $QUERY == *".cu"* 
			|| $QUERY == *".cv"* || $QUERY == *".cw"* || $QUERY == *".cx"* || $QUERY == *".cy"* 
			|| $QUERY == *".cz"* || $QUERY == *".de"* || $QUERY == *".dj"* || $QUERY == *".dk"* 
			|| $QUERY == *".dm"* || $QUERY == *".do"* || $QUERY == *".dz"* || $QUERY == *".ec"* 
			|| $QUERY == *".ee"* || $QUERY == *".eg"* || $QUERY == *".eh"* || $QUERY == *".er"* 
			|| $QUERY == *".es"* || $QUERY == *".et"* || $QUERY == *".eu"* || $QUERY == *".fi"* 
			|| $QUERY == *".fj"* || $QUERY == *".fk"* || $QUERY == *".fm"* || $QUERY == *".fo"* 
			|| $QUERY == *".fr"* || $QUERY == *".ga"* || $QUERY == *".gb"* || $QUERY == *".gd"* 
			|| $QUERY == *".ge"* || $QUERY == *".gf"* || $QUERY == *".gg"* || $QUERY == *".gh"* 
			|| $QUERY == *".gi"* || $QUERY == *".gl"* || $QUERY == *".gm"* || $QUERY == *".gn"* 
			|| $QUERY == *".gp"* || $QUERY == *".gq"* || $QUERY == *".gr"* || $QUERY == *".gs"* 
			|| $QUERY == *".gt"* || $QUERY == *".gu"* || $QUERY == *".gw"* || $QUERY == *".gy"* 
			|| $QUERY == *".hk"* || $QUERY == *".hm"* || $QUERY == *".hn"* || $QUERY == *".hr"* 
			|| $QUERY == *".ht"* || $QUERY == *".hu"* || $QUERY == *".id"* || $QUERY == *".ie"* 
			|| $QUERY == *".il"* || $QUERY == *".im"* || $QUERY == *".in"* || $QUERY == *".io"* 
			|| $QUERY == *".iq"* || $QUERY == *".ir"* || $QUERY == *".is"* || $QUERY == *".it"* 
			|| $QUERY == *".je"* || $QUERY == *".jm"* || $QUERY == *".jo"* || $QUERY == *".jp"* 
			|| $QUERY == *".ke"* || $QUERY == *".kg"* || $QUERY == *".kh"* || $QUERY == *".ki"* 
			|| $QUERY == *".km"* || $QUERY == *".kn"* || $QUERY == *".kp"* || $QUERY == *".kr"* 
			|| $QUERY == *".krd"* || $QUERY == *".kw"* || $QUERY == *".ky"* || $QUERY == *".kz"* 
			|| $QUERY == *".la"* || $QUERY == *".lb"* || $QUERY == *".lc"* || $QUERY == *".li"* 
			|| $QUERY == *".lk"* || $QUERY == *".lr"* || $QUERY == *".ls"* || $QUERY == *".lt"* 
			|| $QUERY == *".lu"* || $QUERY == *".lv"* || $QUERY == *".ly"* || $QUERY == *".ma"* 
			|| $QUERY == *".mc"* || $QUERY == *".md"* || $QUERY == *".me"* || $QUERY == *".mg"* 
			|| $QUERY == *".mh"* || $QUERY == *".mk"* || $QUERY == *".ml"* || $QUERY == *".mm"* 
			|| $QUERY == *".mn"* || $QUERY == *".mo"* || $QUERY == *".mp"* || $QUERY == *".mq"* 
			|| $QUERY == *".mr"* || $QUERY == *".ms"* || $QUERY == *".mt"* || $QUERY == *".mu"* 
			|| $QUERY == *".mv"* || $QUERY == *".mw"* || $QUERY == *".mx"* || $QUERY == *".my"* 
			|| $QUERY == *".mz"* || $QUERY == *".na"* || $QUERY == *".nc"* || $QUERY == *".ne"* 
			|| $QUERY == *".nf"* || $QUERY == *".ng"* || $QUERY == *".ni"* || $QUERY == *".nl"* 
			|| $QUERY == *".no"* || $QUERY == *".np"* || $QUERY == *".nr"* || $QUERY == *".nu"* 
			|| $QUERY == *".nz"* || $QUERY == *".om"* || $QUERY == *".pa"* || $QUERY == *".pe"* 
			|| $QUERY == *".pf"* || $QUERY == *".pg"* || $QUERY == *".ph"* || $QUERY == *".pk"* 
			|| $QUERY == *".pl"* || $QUERY == *".pm"* || $QUERY == *".pn"* || $QUERY == *".pr"* 
			|| $QUERY == *".ps"* || $QUERY == *".pt"* || $QUERY == *".pw"* || $QUERY == *".py"* 
			|| $QUERY == *".qa"* || $QUERY == *".re"* || $QUERY == *".ro"* || $QUERY == *".rs"* 
			|| $QUERY == *".ru"* || $QUERY == *".rw"* || $QUERY == *".sa"* || $QUERY == *".sb"* 
			|| $QUERY == *".sc"* || $QUERY == *".sd"* || $QUERY == *".se"* || $QUERY == *".sg"* 
			|| $QUERY == *".sh"* || $QUERY == *".si"* || $QUERY == *".sj"* || $QUERY == *".sk"* 
			|| $QUERY == *".sl"* || $QUERY == *".sm"* || $QUERY == *".sn"* || $QUERY == *".so"* 
			|| $QUERY == *".sr"* || $QUERY == *".ss"* || $QUERY == *".st"* || $QUERY == *".su"* 
			|| $QUERY == *".sv"* || $QUERY == *".sx"* || $QUERY == *".sy"* || $QUERY == *".sz"* 
			|| $QUERY == *".tc"* || $QUERY == *".td"* || $QUERY == *".tf"* || $QUERY == *".tg"* 
			|| $QUERY == *".th"* || $QUERY == *".tj"* || $QUERY == *".tk"* || $QUERY == *".tl"* 
			|| $QUERY == *".tm"* || $QUERY == *".tn"* || $QUERY == *".to"* || $QUERY == *".tp"* 
			|| $QUERY == *".tr"* || $QUERY == *".tt"* || $QUERY == *".tv"* || $QUERY == *".tw"* 
			|| $QUERY == *".tz"* || $QUERY == *".ua"* || $QUERY == *".ug"* || $QUERY == *".uk"* 
			|| $QUERY == *".us"* || $QUERY == *".uy"* || $QUERY == *".uz"* || $QUERY == *".va"* 
			|| $QUERY == *".vc"* || $QUERY == *".ve"* || $QUERY == *".vg"* || $QUERY == *".vi"* 
			|| $QUERY == *".vn"* || $QUERY == *".vu"* || $QUERY == *".wf"* || $QUERY == *".we"* 
			|| $QUERY == *".ye"* || $QUERY == *".yt"* || $QUERY == *".za"* || $QUERY == *".zm"* 
			|| $QUERY == *".zw"* ]]; then
			echo "Domain used"
			$command http://$QUERY
			exit
		else
			echo "Search Query"
			$command http://www.google.com/search?q=$QUERY
			exit
		fi
	else
		QUERY=""
		for searchitem in "$@"
		do
			# Concatenating search query
			QUERY=$QUERY$searchitem+
		done
		$command http://www.google.com/search?q=${QUERY::-1}
	fi
fi
exit
