import re
htmlStr = """<html>

<!-- #begintemplate "main%20template%20flash%20generic%20720.dwt" -->

<head>

<meta content="text/html; charset=utf-8" http-equiv="content-type"/>

<meta content="bar, grill,north, kansas city,friendly,friendliest,night,club,live,entertainment,beer,pool,dining,lunch,catering,private,party" name="keywords"/>

<meta content="kansas city's friendliest bar north of the river" name="description"/>

<meta content="diicl05uxcscjt_hdcprrr7xkbjp97oc-dwbz3ftveo" name="google-site-verification">

<script src="stmenu.js" type="text/javascript"></script>

<!-- #begineditable "doctitle" -->

<title>pat's pub</title>

<!-- #endeditable -->

<link href="patpubgen720.css" rel="stylesheet" type="text/css"/>

</meta></head>

<body background="web/g/brbnblck.gif" bgcolor="#000000" style="background-attachment: fixed">

<div id="graphic">

<p align="center">

<object align="" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" height="267" id="ppkcmobnr" width="500">

<param name="movie" value="web/g/ppkcmobnr.swf"/>

<param name="quality" value="high"/> <param name="wmode" value="transparent"/> <param name="bgcolor" value="#333399"/>

<param name="loop" value="false"/>

<param name="menu" value="false"/>

<embed align="" bgcolor="#333399" height="267" loop="false" menu="false" name="ppkcmobnr" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high" src="web/g/ppkcmobnr.swf" type="application/x-shockwave-flash" width="500" wmode="transparent"/> </object>

	</p></div>

<div id="menu">

<p style="margin-top: 6; margin-bottom: 0">

<span style="visibility: hidden">

<a style="display:none;visibility:hidden;">main menu---&gt;</a>

</span>

<script src="ppnkcmenu.js" type="text/javascript"></script>

</p></div>

<div id="regbody">

<table border="0" cellpadding="0" cellspacing="0" width="100%">

<tr>

<td valign="top">

<!-- #begineditable "pagebody" -->

				 <div align="center">

<table bgcolor="#ffffff" border="0" cellpadding="0" width="520">

<tr>

<td align="center">

<p><b><br/>

				all day - every day<br/>

</b>

<img align="left" border="0" height="37" src="web/g/jbomb.gif" width="52"/>jagerbombs

				$5.00        <br/>

				starbursts $5.00       <br/>

 </p><hr style="position: relative" width="75%"/>

<p style="margin-top: 12px">

<b>happy hour - everyday<br/>

</b>

<img align="left" border="0" height="53" src="web/g/bucket.gif" width="54"/>3:00 -7:00 pm            <br/>

				bucket $12.00 <i><font size="2">(domestic only)

				</font></i>

<br/>

<font size="2">(that's $2.00 per bottle!)

				</font><br/>

 </p>

<hr style="position: relative" width="75%"/>

<p><b>mondays<br/>

</b>

<br/>

<u><i>internet special<br/>

</i></u>mention this website ad and get<u><i><br/>

</i></u> $5.00 domestic pitchers<br/>

				 </p>

<hr style="position: relative" width="75%"/>

<p><b>wednesday - ladies night<br/>

</b>

<u><i>

<img align="left" border="0" height="54" src="web/g/shoe.png" width="56"/></i></u>$1

				draw beer              <br/>

				$2 wells                <br/>

				6pm to close            <br/>

  </p>

<hr style="position: relative" width="75%"/>

<p><b>thursday - taco night</b><br/>

<img align="left" border="0" height="34" src="web/g/tacos.gif" width="42"/>6:30-8:30 pm             <br/>

<img align="left" border="0" height="53" src="web/g/margarita.gif" width="43"/>tacos $1.00 each                  <br/>

<img align="left" border="0" height="54" src="web/g/corona.gif" width="14"/>margaritas $2.50                    <br/>

				corona's $2.50<br/>

 </p>

<hr style="position: relative" width="75%"/>

<p><b>friday &amp; saturday - live music events<br/>

</b>

<img align="left" border="0" height="54" hspace="0" src="web/g/livemusic.gif" width="72"/>music

				from 8pm to midnight          <br/>

				14 oz draws $2.00

				<br/>

				domestic buckets 6-beers for $15.00<br/>

 <i><font size="2">(that makes them just $2.50 a

				bottle!)</font></i><br/>



				blues, jazz, country rock, or classic rock only.<br/>

    check out our <a href="/events.html"><font color="#ff0000">events calendar</font></a>

				for details</p>

<hr style="position: relative" width="75%"/>

<p><b>pool league nights available<br/>

</b>

<img align="left" border="0" height="41" src="web/g/billiards.gif" width="59"/>tuesday, wednesday,

				<br/>

            and thursday

				<p> <br/>

<a href="/contactus.html"><font color="#ff0000">contact us</font></a>

				at: 816-471-8752 <br/>

 </p></p></td>

</tr>

</table>

</div>

<!-- #endeditable --></td>

</tr>

<tr>

<td height="8">

<p align="center"><font color="#999999" style="font-size: 2pt">

<i> </i></font></p></td>

</tr>

<tr>

<td>

<p align="center"><i><font color="#999999" size="1">copyright pat's pub</font></i></p></td>
</tr>

</table>

</div>

</body>

<!-- #endtemplate -->

</html>"""



FULL_DAYS_OF_WEEK = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "everyday"]
ABBR_DAYS_OF_WEEK = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
TIMES = ["1am", "2am", "3am", "4am", "5am", "6am", "7am", "8am", "9am", "10am", "11am", "12am", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12pm"]

def parseString(html):

    hhIndex = html.find("happy hour")
    print(hhIndex)

    fullDay = []
    abbrDay = []
    times = []

    for i in range(0, 8):
        fullDay.append([m.start() for m in re.finditer(FULL_DAYS_OF_WEEK[i], html)])
        if i < 7:
            abbrDay.append([m.start() for m in re.finditer(ABBR_DAYS_OF_WEEK[i], html)])

    for i in range(0, 24):
        times.append([m.start() for m in re.finditer(TIMES[i], html)])

    datesToSearch = []

    fullDayIsNullIndex = 0
    for i in range(0, 8):
        if fullDay[i] == None:
            fullDayIsNullIndex += 1

    if fullDayIsNullIndex == 8:
        datesToSearch = abbrDay
    else:
        datesToSearch = fullDay

    dayDistances = []
    timeDistances = []

    for i in range(0, 8):
        for j in range(0, len(datesToSearch[i])):
            if datesToSearch is not None:
                dayDistances.append(abs(hhIndex - datesToSearch[i][j]))

    for i in range(0, 24):
        for j in range(0, len(times[i])):
            if timeDistances is not None:
                timeDistances.append(abs(hhIndex - times[i][j]))

    date1Final = ""
    date2Final = ""
    time1Final = ""
    time2Final = ""

    date1Index = dayDistances.index(min(dayDistances))
    date1Final = dayDistances[date1Index]
    dayDistances[date1Index] = 2**(63-1)
    date2Index = dayDistances.index(min(dayDistances))
    date2Final = dayDistances[date2Index]

    time1Index = timeDistances.index(min(timeDistances))
    time1Final = timeDistances[time1Index]
    timeDistances[time1Index] = 2**(63-1)
    time2Index = timeDistances.index(min(timeDistances))
    time2Final = timeDistances[time2Index]

    print(fullDay)
    print(abbrDay)
    print(times)
    print()
    print(date1Index)
    print(date2Index)
    print(time1Index)
    print(time2Index)
    print()
    print(FULL_DAYS_OF_WEEK[date1Index])
    print(FULL_DAYS_OF_WEEK[date2Index])
    print(TIMES[time1Index])
    print(TIMES[time2Index])
    print()

if __name__ == '__main__':
    parseString(htmlStr)
