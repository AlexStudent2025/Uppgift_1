# Uppgift 1
Ett enkelt powershell-script som ber användaren om ett namn, skapar en mapp med tre undermappar samt en loggfil i /logs med det nuvarande datumet och exakta tiden som mapparna skapas.

Formatteringen är lite stökig, och jag tror att jag deklarerar fler variabler än vad jag egentligen behöver. $date och $time borde nog egentligen kunna vara en variabel där man bara väljer vilken del som skall skrivas ut (eller hela för båda.) Jag hade också några problem med att få felhanteringen att fungera, men det visade sig att jag bara hade glömt -Erroraction Stop på try-delen.
