
## SOTKAnet-indikaattoripankki mukaan avoimen tieteen työkalupakkiin ##

Terveyden ja hyvinvoinnin laitos (THL) avasi äskettäin avoimen
koneluettavan rajapinnan
[SOTKAnet-indikaattoripankkiin](http://uusi.sotkanet.fi/portal/page/portal/etusivu/tietoa_palvelusta),
joka tarjoaa ajantasaiseen kuntajakoon pohjautuvia tilastoja
väestörakenteesta, hyvinvoinnista sekä sosiaali- ja terveyspalveluiden
käytöstä vuodesta 1990 alkaen. Mukana on myös THL:n
[sairastavuusindeksi](http://terveytemme.fi), johon on koottu tietoa
useista rekistereistä keskeisten sairauksien esiintyvyydestä eri
puolilla maata sekä ikävakioituina että absoluuttisina arvoina ja
keskeisiä terveystilastoja Euroopan alueelta. Yhteensä yli 2000
tilastoindikaattorin kokoelmaa voi selata SOTKAnetin
[portaalisivulla](http://uusi.sotkanet.fi/portal/page/portal/etusivu/hakusivu).

Tietojen tehokas tutkimuskäyttö edellyttää kehittyneitä ja joustavia
analyysivälineitä ja mahdollisuutta yhdistellä aineistoja sujuvasti
muihin tietolähteisiin. [R-kieli](www.r-project.org) on tieteellisessä
laskennassa suosittu avoimen lähdekoodin laskentaympäristö, johon on
saatavilla laskenta- ja visualisointimenetelmien lisäksi käteviä
välineitä keskeisten aineistojen automatisoituun hakuun,
esikäsittelyyn ja yhdistelyyn. Suomalaisten tiedonlouhijoiden
tarpeisiin vastaa erityisesti avoimen datan työkalupakki
[sorvi](http://louhos.github.com/sorvi), joka tarjoaa [automatisoituja
välineitä 20 avoimelle kotimaiselle
tietolähteelle](https://github.com/louhos/sorvi/wiki/data/).

Valmiit R-hakurutiinit SOTKAnetin hyvinvointi-indikaattoreille on nyt
lisätty sorviin [Louhoksen](http://louhos.github.com) ja
[Opasnetin](http://fi.opasnet.org/fi/) yhteistyönä. Voit selata koodia
ja kokeilla esimerkkejä kartta- ja aikasarjavisualisoinneista ja
SOTKAnetin yhdistämisestä [Maanmittauslaitoksen avoimeen
paikkatietoon](http://www.maanmittauslaitos.fi/avoindata) helposti
[Opasnet-sivuston](http://fi.opasnet.org/fi/Sotkanet)
vuorovaikutteisessa palvelinsovelluksessa ennen paketin asentamista
omalle koneelle. 

Huomionarvoista työssä on, että R-kirjaston avulla koko analyysiputken
aineistojen lataamisesta ja esikäsittelystä yhdistelyyn,
tilastolliseen testaukseen ja visualisointiin voi nyt automatisoida
helposti ja läpinäkyvästi. Esimerkkinä Eurostatin Työmarkkinatilaston
nuorisotyöttömyysaste Suomessa 1990-2012 (kuva 1) ja Suomen kuntien
nettomuuton visualisointi THL:n ja Maanmittauslaitoksen (MML)
aineistoista (kuvat 2-3). Täydet lähdekoodit esimerkkien toistamiseen
löydät [Datawikistä](https://github.com/louhos/sorvi/wiki/Sotkanet).

Tieteellisen laskennan ja avoimen koneluettavan väestödatan
saumaton yhdistäminen tarjoaa uusia välineitä kvantitatiiviseen
yhteiskuntatutkimukseen. Erityisen lupaava on mahdollisuus eri
lähteistä saatavien aineistojen laskennalliseen
yhdistelyyn. Syvällisempi pureutuminen tietomassaan vaatii tarkempaa
perehtymistä aihepiiriin ja hyviä
tutkimuskysymyksiä. Laskentarutiinien automatisoinnin ansiosta tähän
vapautuu nyt entistä enemmän aikaa ja laskennan automatisointi
parantaa analyysien toistettavuutta, läpinäkyvyyttä ja luotettavuutta.

Datan ja laskentavälineiden avoin saatavuus tuo nämä mahdollisuudet
nyt ensi kertaa kaikkien kiinnostuneiden ulottuville - tutkimuskäytön
lisäksi aineistoja voidaan hyödyntää vaikkapa opinnäytetöissä,
järjestötoiminnassa tai datajournalismissa. Yhteisövetoinen hankkeemme
etenee vapaaehtoispohjalta - [tervetuloa
mukaan!](http://louhos.github.com/contact.html)


![sotkanet1](https://github.com/louhos/sorvi/wiki/sotkanetData.png)
![sotkanet2](https://github.com/louhos/sorvi/wiki/sotkanetVisu2.png)
![sotkanet3](https://github.com/louhos/sorvi/wiki/sotkanetVisu3.png)

**Kuvateksti** (1) Nuorisotyöttömyysaste Suomessa 1990-2012 (Lähde: SOTKAnet/Eurostatin Työmarkkinatilasto). (2) Kuntien nettomuutto 1000 asukasta kohden (Lähde: SOTKAnet/THL ja MML). (3) Kunnan väkiluku, nettomuutto ja työllisyys. Pienten kuntien nettomuuttoasteessa on enemmän suhteellista satunnaisvaihtelua. Huomattavinta nettomuutto on 103 asukkaan Sottungassa. (Lähde: SOTKAnet/THL). 

**SOTKAnetin tekninen toteutus ja käyttöoikeudet:** SOTKAnetin avoin
rajapinta on tarkoitettu tietojen noutamiseen erissä niiden
jatkokäyttöä varten eri sovelluksissa; sitä ei ole tarkoitettu
jatkuvaan verkon kautta tapahtuvaan käyttöön.  Rajapinnan kautta
saatua aineistoa käytettäessä on mainittava lähteenä Terveyden ja
hyvinvoinnin laitos ja SOTKAnet sekä tarjottava linkki osoitteeseen
http://www.sotkanet.fi. Kunkin aineiston osalta on mainittava erikseen
tilaston tai indikaattorin tuottajataho.  Aineistojen käyttöoikeudet
riippuvat tilaston tuottajatahosta. Tarkempia tietoja aineistojen
lisensoinnista, käyttöoikeuksista, viittauskäytännöistä, rajapinnan
teknisestä toteutuksesta ja muista yksityiskohdista antaa [SOTKAnet
REST
API](http://uusi.sotkanet.fi/portal/pls/portal/!PORTAL.wwpob_page.show?_docname=22001.PDF).


**Kirjoittajista:** SOTKAnetin R-rajapinta toteutettiin Louhos- ja
Opasnet-tiimien yhteistyönä: hankkeeseen kontribuoivat kirjoittajan
ohella Einari Happonen, Jouni Tuomisto, Juuso Parkkinen ja Joona
Lehtomäki. [Louhos](http://louhos.github.com) ja
[Opasnet](http://fi.opasnet.org/fi/) kehittävät menetelmiä avoimen
datan ja tieteellisen laskennan hyödyntämiseen tutkimuksessa,
julkisessa keskustelussa ja päätöksenteossa. Blogipostauksen
kirjoittaja Leo Lahti (Helsingin ja Wageningenin yliopistot) on
akatemian tutkijatohtori ja soveltavan data-analyysin tutkija.


