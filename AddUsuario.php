<?php

//Dentro de index.php

require 'Database.php';


print Database::getInstance()->getDb()->errorCode();
?>