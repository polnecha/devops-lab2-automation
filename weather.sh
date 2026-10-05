   #!/bin/bash
   
   CITY=${1:-Perm}
   
   TEMP=$(curl -s "wttr.in/$CITY?format=j2" | jq -r '.current_condition[0].temp_C')
   HUM=$(curl -s "wttr.in/$CITY?format=j2" | jq -r '.current_condition[0].humidity')
   
   echo "<!DOCTYPE html>" > /var/www/html/index.html
   echo "<html>" >> /var/www/html/index.html
   echo "<head>" >> /var/www/html/index.html
   echo "    <meta charset=\"UTF-8\">" >> /var/www/html/index.html
   echo "    <title>Погода в $CITY</title>" >> /var/www/html/index.html
   echo "</head>" >> /var/www/html/index.html
   echo "<body>" >> /var/www/html/index.html
   echo "    <h1>Погода в городе: $CITY</h1>" >> /var/www/html/index.html
   echo "    <p>Температура: $TEMP °C</p>" >> /var/www/html/index.html
   echo "    <p>Влажность: $HUM %</p>" >> /var/www/html/index.html
   echo "    <p><i>Обновлено: $(date)</i></p>" >> /var/www/html/index.html
   echo "</body>" >> /var/www/html/index.html
   echo "</html>" >> /var/www/html/index.html
