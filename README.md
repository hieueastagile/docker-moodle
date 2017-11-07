# docker-moodle
Moodle on nginx + php-fpm in docker

## Installation
Firstly, change your database name/username/password in docker-compose.yml file, see the section about the db.
Run 
```bash
docker-compose run moodle --rm bash
```

Run the setup from admin/cli
```bash
cd /moodle
chsh -s /bin/bash www-data && su www-data  # by default, www-data user is not enabled to run any shell yet
php admin/cli/install.php
```

You need to provide moodle some of your configuration information, which included your database information above. In database host, please put `db` there, and port should be `5432`. 

```bash
www-data@d1ed95c11e7b:/moodle$ php admin/cli/install.php
                                 .-..-.       
   _____                         | || |       
  /____/-.---_  .---.  .---.  .-.| || | .---. 
  | |  _   _  |/  _  \/  _  \/  _  || |/  __ \
  * | | | | | || |_| || |_| || |_| || || |___/
    |_| |_| |_|\_____/\_____/\_____||_|\_____)

Moodle 3.3.2 (Build: 20170911) command line installation program
-------------------------------------------------------------------------------
== Choose a language ==
en - English (en)
? - Available language packs
type value, press Enter to use default value (en)
: en
-------------------------------------------------------------------------------
== Data directories permission ==
type value, press Enter to use default value (2777)
: 
-------------------------------------------------------------------------------
== Web address ==
type value
: http://localhost
-------------------------------------------------------------------------------
== Data directory ==
type value, press Enter to use default value (//moodledata)
: /moodle-data
-------------------------------------------------------------------------------
== Choose database driver ==
 pgsql 
type value, press Enter to use default value (pgsql)
: 
-------------------------------------------------------------------------------
== Database host ==
type value, press Enter to use default value (localhost)
: db
-------------------------------------------------------------------------------
== Database name ==
type value, press Enter to use default value (moodle)
:       
-------------------------------------------------------------------------------
== Tables prefix ==
type value, press Enter to use default value (mdl_)
: 
-------------------------------------------------------------------------------
== Database port ==
type value, press Enter to use default value ()
: 5432
-------------------------------------------------------------------------------
== Database user ==
type value, press Enter to use default value (root)
: moodle
-------------------------------------------------------------------------------
== Database password ==
type value
: <database password here>
-------------------------------------------------------------------------------
== Full site name ==
type value
: Involvio University
-------------------------------------------------------------------------------
== Short name for site (eg single word) ==
type value
: InvolvioU
-------------------------------------------------------------------------------
== Admin account username ==
type value, press Enter to use default value (admin)
:      
-------------------------------------------------------------------------------
== New admin user password ==
type value
: <admin password here>
-------------------------------------------------------------------------------
== New admin user email address ==
type value, press Enter to use default value ()
: <admin email here>
-------------------------------------------------------------------------------
== Upgrade key (leave empty to not set it) ==
type value
```

## Troubleshoot
- You might not get the correct style when you visit the first time, try to increase your max_excution_time (see php.ini), and memory_limit (see www.conf, php_admin_value[memory_limit]) it might possibly fix it.
- For web address, remember not to put the port into your url (http://localhost:xxx), moodle by default won't work with it.
